function indexOf(array, value)
  for i, v in ipairs(array) do
    if v == value then
      return i
    end
  end
  return nil
end

return {
  {
    'mattn/emmet-vim',
    init = function()
      vim.g.user_emmet_mode = 'i'
      vim.g.user_emmet_leader_key = ','
      vim.g.user_emmet_install_global = 0
    end
    -- 2024/lua/plugins/completion.lua|101 col 9| emmet_ls = {},
    -- 0.original/init.vim|540 col 50| autocmd FileType html,css,vue,htmldjango EmmetInstall
    -- 0.original/lua/rwb/complete.lua|260 col 6| -- emmet_ls = {},
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'ray-x/lsp_signature.nvim',
      'folke/neodev.nvim',
    },
    config = function()
      -- Set completeopt to have a better completion experience
      -- set completeopt=menu,menuone,noinsert,noselect,preview
      vim.o.completeopt = 'menuone,noselect'

      -- [[ Configure LSP ]]
      --  This function gets run when an LSP connects to a particular buffer.
      local on_attach = function(_, bufnr)
        if vim.api.nvim_buf_get_name(bufnr):match "^%a+://" then
          return
        end
        -- NOTE: Remember that lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself
        -- many times.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', function()
          vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
        end, '[C]ode [A]ction')

        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end

      -- mason-lspconfig requires that these setup functions are called in this order
      -- before setting up the servers.
      -- require('mason').setup()
      -- require('mason-lspconfig').setup()

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. They will be passed to
      --  the `settings` field of the server config. You must look up that documentation yourself.
      --
      --  If you want to override the default filetypes that your language server will attach to you can
      --  define the property 'filetypes' to the map in question.
      local servers = {
        -- clangd = {},
        -- gopls = {},
        pyright = {},

        gopls = {
          filetypes = { 'go', 'templ' },
        },
        templ = {},
        html = {},
        emmet_ls = {},
        -- templ = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- tsserver = {},
        -- html = { filetypes = { 'html', 'twig', 'hbs'} },

        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
              -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          }
        },
        terraformls = {
          -- on_attach = function (_, bufnr)
          --   vim.api.nvim_create_autocmd({"BufWritePre"}, {
          --     pattern = {"*.tf", "*.tfvars"},
          --     callback = vim.lsp.buf.formatting_sync(),
          --   })
          -- end
          --
          init_options = {
            indexing = {
              ignorePaths = { ".terraform", "examples" }
            }
          }
        },
        -- tflint = {},
      }

      -- Setup neovim lua configuration
      require('neodev').setup()

      -- require('lsp_signature').setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = vim.tbl_keys(servers),
        automatic_enable = false,
      }

      -- now the new API exists:
      for name, cfg in pairs(servers) do
        vim.lsp.config(name, {
          capabilities = capabilities,
          on_attach    = function(client, bufnr)
            if vim.api.nvim_buf_get_name(bufnr):match "^%a+://" then
              return
            end
            on_attach(client, bufnr)
            if cfg.on_attach then cfg.on_attach(client, bufnr) end
          end,
          settings     = cfg.settings,
          filetypes    = cfg.filetypes,
          init_options = cfg.init_options,
          flags        = {
            allow_incremental_sync = false,
          },
        })
      end

      vim.lsp.enable(vim.tbl_keys(servers))
    end
  },

  -- Autocompletion interface
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'petertriho/cmp-git',
      'davidsierradz/cmp-conventionalcommits',
      'Dosx001/cmp-commit',
      'f3fora/cmp-spell',
      'hrsh7th/cmp-calc',
      {
        'uga-rosa/cmp-dictionary',
        dependencies = {
          'nvim-lua/plenary.nvim'
        }
      },
      -- 'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',
      "zbirenbaum/copilot.lua",
      "zbirenbaum/copilot-cmp",
      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',

      'onsails/lspkind-nvim',

      'windwp/nvim-autopairs'
    },
    config = function()
      -- [[ Configure nvim-cmp ]]
      -- See `:help cmp`
      local cmp = require 'cmp'
      local copilot = require("copilot.suggestion")
      local luasnip = require 'luasnip'
      local lspkind = require('lspkind')
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        completion = {
          completeopt = 'menu,menuone,noinsert',
        },

        mapping = cmp.mapping.preset.insert {
          ['<C-j>']       = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item()
            else
              copilot.next()
            end
          end),
          ['<C-k>']       = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            else
              copilot.prev()
            end
          end),
          -- jump to top
          ['<C-S-k>']     = cmp.mapping(function()
            cmp.select_prev_item({
              count = indexOf(cmp.get_entries(), cmp.get_selected_entry()) - 1
            })
          end),
          -- jump to bottom
          ['<C-S-j>']     = cmp.mapping(function()
            cmp.select_next_item({
              count = (
              --length of get_entries - index of selected entry
                #cmp.get_entries() -
                indexOf(cmp.get_entries(), cmp.get_selected_entry())
              )
            })
          end),
          ['<C-b>']       = cmp.mapping.scroll_docs(-4),
          ['<C-f>']       = cmp.mapping.scroll_docs(4),
          ['<C-Space>']   = cmp.mapping(function() -- Open nvim-cmp
            -- NOTE: Might be commented out to refrain from "toggles", which
            -- require the brain to remember the state of the completion menu
            -- Experimenting for now

            if cmp.visible() then
              cmp.abort()
              copilot.dismiss()
            else
              copilot.dismiss()
              cmp.complete()
            end
          end),
          ['<C-l>']       = cmp.mapping(function() -- Accept copilot word (or open copilot)
            if cmp.visible() then
              -- NOTE: Commented out to refrain from "toggles", which require
              -- the brain to remember the state of the completion menu

              -- if cmp.get_selected_entry().source.name == "copilot" then
              cmp.abort()
              copilot.next()
              -- else
              --   cmp.confirm({
              --     behavior = cmp.ConfirmBehavior.Insert,
              --     select = true,
              --   })
              -- end
            elseif copilot.is_visible() then
              copilot.accept_word()
              -- Add undo-break, then leave and enter insert mode to prevent nvim-cmp from opening
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-g>u<esc>a', true, false, true), 'n', true)

              -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'n', true)
              -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('a', true, false, true), 'n', true)

              -- copilot.next()
              --on next tick open copolit again
              vim.defer_fn(function()
                copilot.next()
              end, 0)
            else
              copilot.next()
            end
          end),
          ['<C-S-l>']     = cmp.mapping(function() -- Accept copilot line (or open copilot)
            if cmp.visible() then
              cmp.abort()
              copilot.next()
              -- Commented out to have evething doing 1 thing

              -- cmp.confirm({
              --   behavior = cmp.ConfirmBehavior.Insert,
              --   select = true,
              -- })
            elseif copilot.is_visible() then
              copilot.accept_line()
            else
              copilot.next()
            end
          end),
          ['<C-y>']       = cmp.mapping(function() -- Accept whole copilot suggestion or nvim-cmp
            if cmp.visible() then
              cmp.confirm({
                -- behavior = cmp.ConfirmBehavior.Insert,
                select = true,
              })
              -- Add undo-break
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-g>u', true, false, true), 'n', true)
            else
              copilot.accept()
              -- Add undo-break
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-g>u', true, false, true), 'n', true)
            end
          end),
          ['<c-s-space>'] = cmp.mapping(function() -- Close all completion
            copilot.dismiss()
            cmp.abort()
          end),
          -- Commented out to have 1 way for doing everything
          -- ['<C-n>']     = cmp.mapping(function()
          --   if cmp.visible() then
          --     cmp.select_next_item()
          --   else
          --     copilot.next()
          --   end
          -- end),
          -- ['<C-p>']     = cmp.mapping(function()
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   else
          --     copilot.prev()
          --   end
          -- end),
          -- ['<C-h>']     = cmp.mapping(function() -- Toggle between completion and copilot (or open nvim-cmp)
          --   if cmp.visible() then
          --     cmp.abort()
          --     copilot.next()
          --     -- elseif copilot.is_visible() then
          --   else
          --     copilot.dismiss()
          --     cmp.complete()
          --   end
          -- end),
        },

        sources = {
          -- { name = "copilot",  priority = 200, }, -- Not a fan of having this
          -- in cmp
          { name = "nvim_lsp", priority = 100, },
          { name = "luasnip",  priority = 50,  max_item_count = 5, entry_filter = function() return true end },
          {
            name = "buffer",
            priority = 50,
            max_item_count = 4,
            option = {
              get_bufnrs = function()
                return vim.api
                    .nvim_list_bufs()
              end,
            },
          },
          -- { name = "nvim_lua",   priority = 10 },
          { name = "path",       priority = 10, },
          { name = "git",        priority = 10, },
          -- Supplementary
          { name = "dictionary", priority = 5,  max_item_count = 4, keyword_length = 2 },
          { name = 'spell',      priority = 5,  max_item_count = 2, keyword_length = 2, option = { keep_all_entries = true, }, },
          { name = 'calc',       priority = 5, },
        },

        sorting = {
          priority_weight = 1,
          comparators = {
            -- NOTE: Not using score makes all priority irrelevant
            cmp.config.compare.score, -- final_score = orig_score + ((#sources - (source_index - 1)) * sorting.priority_weight) (priority_weight = sources[n].priority
          }
        },

        formatting = {
          format = lspkind.cmp_format({
            with_text = true,
            mode = 'symbol_text',
            menu = {
              copilot    = " ",
              buffer     = "buf",
              nvim_lsp   = "LSP",
              -- nvim_lua   = "api",
              path       = "path",
              luasnip    = "snip",
              -- cmp_tabnine = "TN",
              git        = "git",
              dictionary = "dict",
              calc       = "calc",
              spell      = "spell",
            }
          })
        }
      }

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local handlers = require('nvim-autopairs.completion.handlers')

      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done({
          filetypes = {
            -- "*" is a alias to all filetypes
            ["*"] = {
              ["("] = {
                kind = {
                  cmp.lsp.CompletionItemKind.Function,
                  cmp.lsp.CompletionItemKind.Method,
                },
                handler = handlers["*"]
              }
            },
          }
        })
      )

      require("cmp_dictionary").setup({
        paths = { "/usr/share/dict/words" },
        exact_length = 2,
        first_case_insensitive = true,
        document = {
          enable = false,
          command = { "wn", "${label}", "-over" },
        },
        async = true,
      })

      require("cmp_git").setup({
        filetypes = { "*" },
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
          { name = 'conventionalcommits' },
          { name = 'buffer' },
          { name = 'commit' },
        })
      })

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' },
        })
      })

      require('cmp_commit').setup({
        -- set = true,
        -- format = { "<<= ", " =>>" },
        length = 9,
        block = { "__pycache__", "CMakeFiles", "node_modules", "target" },
        -- word_list = "~/cmpcommit.json",
        repo_list = {
          -- { "Name of repo", "PATH/TO/FILE.json" }
        }
      })

      require('copilot').setup({
        copilot_model = "o4-mini-high"
      })

      require("copilot_cmp").setup()
    end
  },
  {
    'kosayoda/nvim-lightbulb',
    opts = {
      autocmd = { enabled = true }
    }
  },
  {
    "juliosueiras/vim-terraform-completion",
  },
  {
    'stevearc/conform.nvim', -- formatting
    opts = {
      notify_on_error = false,
      format_after_save = function(bufnr)
        -- Notify that we're formatting
        -- vim.notify('Formatting buffer')
        -- if vim.bo[bufnr].filetype == "html" then
        --   return
        -- end
        return {
          timeout_ms = 500,
          lsp_fallback = true,
          async = true, -- If true the method won't block. Defaults to false. If the buffer is modified before the formatter completes, the formatting will be discarded.
        }
      end,
      -- When having multiple attached lsps for a single filetype, the formatter to use can be speficied. See https://github.com/stevearc/conform.nvim#formatters
      formatters_by_ft = {
        terraform = { 'terraform_fmt' },
        hcl = { 'terraform_fmt' },
        templ = { 'templ' },
        htmldjango = { 'djlint' },
        html = { 'djlint' },
      }
    },
  },
  {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for nice icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    build = "make", -- pulls native binary
    -- load lazily, but ensure on startup so switcher works
    event = "VeryLazy",
    config = function()
      require("avante").setup({
        -- start with Copilot by default
        provider = "gemini",

        web_search_engine = {
          provider = "google", -- tavily, serpapi, google, kagi, brave, or searxng
          -- proxy = nil, -- proxy support, e.g., http://127.0.0.1:7890
        },

        providers = {
          -- Copilot provider piggy-backs on your copilot.lua setup

          copilot = {
            model = "gemini-2.5-pro",
            extra_request_body = {
              max_tokens = 1000000,
            },
          },

          claude = {
            api_key_name = "cmd:cat ~/.ssh/claude.api", -- the shell command must prefixed with `^cmd:(.*)`
            -- api_key_name = {"bw","get","notes","anthropic-api-key"}, -- if it is a table of string, then default to command.
          },

          gemini = {
            api_key_name = "cmd:cat ~/.ssh/gemini.api", -- the shell command must prefixed with `^cmd:(.*)`
            model        = "gemini-2.5-pro",            -- $1.25 - $2.50 per Million tokens
            model        = "gemini-2.5-flash",          -- $0.30 per Million tokens
            temperature  = 0,
            max_tokens   = 4096,
          },


          grok = {
            endpoint = "https://api.x.ai/v1/chat/completions", -- xAI API endpoint
            model = "grok-4-0709",                             -- Adjust to grok-3-latest if not available
            api_key_name = "cmd:cat ~/.ssh/xai_grok.api",      -- Read API key from file
            is_disable_stream = function() return false end,   -- Enable streaming
            parse_messages = function(code_opts)
              local messages = {
                { role = "system", content = code_opts.system_prompt or "You are a helpful coding assistant." },
              }
              vim.iter(code_opts.messages or
                { { role = "user", content = code_opts.question or "Please provide a response." } })
                  :each(function(msg)
                    table.insert(messages,
                      { role = msg.role or "user", content = msg.content or "Please provide a response." })
                  end)
              return messages
            end,
            parse_curl_args = function(opts, code_opts)
              local api_key = vim.fn.system("cat ~/.ssh/xai_grok.api"):gsub("\n", ""):gsub("\r", "")
              -- Debug: Log the API key (partially masked for safety)
              vim.api.nvim_out_write("API key sent: " .. api_key:sub(1, 3) .. "***" .. api_key:sub(-4) .. "\n")
              if api_key == "" or api_key:match("^%s*$") then
                vim.api.nvim_err_writeln("Error: API key is empty or not read from ~/.ssh/xai_grok.api")
              end
              return {
                url = opts.endpoint,
                headers = {
                  ["Authorization"] = "Bearer " .. api_key,
                  ["Content-Type"] = "application/json",
                },
                body = {
                  model = opts.model,
                  messages = opts.parse_messages(code_opts),
                  max_tokens = 4096,                     -- Adjust based on API limits
                  temperature = 0.7,                     -- Adjust for response creativity
                  stream = not opts.is_disable_stream(), -- Enable streaming
                },
              }
            end,
            parse_response = function(data_stream, event_state, opts)
              if event_state == "done" then
                opts.on_complete()
                return
              end
              if data_stream == nil then
                return
              end
              -- Handle data_stream as a table (SSE events)
              if type(data_stream) == "table" then
                for _, line in ipairs(data_stream) do
                  if type(line) == "string" then
                    -- Debug: Log each line
                    vim.api.nvim_out_write("Raw response line: " .. line .. "\n")
                    if line:match("^data:") then
                      local json_str = line:gsub("^data:%s*", "")
                      if json_str == "[DONE]" then
                        opts.on_complete()
                        return
                      end
                      local success, json = pcall(vim.json.decode, json_str)
                      if not success then
                        vim.api.nvim_err_writeln("Failed to decode JSON: " .. json_str)
                        return
                      end
                      local delta = json.choices and json.choices[1] and json.choices[1].delta and
                          json.choices[1].delta.content
                          or json.deltaText
                      local stopReason = json.stopReason
                      if stopReason == "end_turn" then
                        return
                      end
                      if delta then
                        opts.on_chunk(delta)
                      else
                        vim.api.nvim_err_writeln("No delta content in response: " .. vim.inspect(json))
                      end
                    end
                  end
                end
              else
                -- Fallback for non-table data_stream (unlikely)
                vim.api.nvim_out_write("Raw response (non-table): " .. tostring(data_stream) .. "\n")
                local success, json = pcall(vim.json.decode, data_stream)
                if not success then
                  vim.api.nvim_err_writeln("Failed to decode JSON: " .. tostring(data_stream))
                  return
                end
                local delta = json.choices and json.choices[1] and json.choices[1].delta and
                    json.choices[1].delta.content
                    or json.deltaText
                local stopReason = json.stopReason
                if stopReason == "end_turn" then
                  return
                end
                if delta then
                  opts.on_chunk(delta)
                else
                  vim.api.nvim_err_writeln("No delta content in response: " .. vim.inspect(json))
                end
              end
            end,
          },
        },

        --   -- Gemini config (requires GEMINI_API_KEY env var)
        --   gemini = {
        --     api_key     = os.getenv("GEMINI_API_KEY"),
        --     model       = "gemini-1.5-flash",
        --     temperature = 0,
        --     max_tokens  = 4096,
        --   },
        -- },


        -- mappings = {
        --   submit = {
        --     insert =
        --   }
        -- }

        -- (you can also add openai/claude/azure/cohere here if desired)
      })

      -- Automatically switch to your preferred provider on startup
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          if vim.fn.exists(":AvanteSwitchProvider") == 2 then
            -- change to ENV-driven default, or stick with copilot
            local p = os.getenv("AVANTE_PROVIDER") or "copilot"
            vim.cmd("AvanteSwitchProvider " .. p)
          end
        end,
      })

      -- Keymaps for switching providers
      vim.keymap.set("n", "<leader>ap", "<cmd>AvanteSwitchProvider copilot<CR>", {
        desc = "Avante → Copilot",
      })
      vim.keymap.set("n", "<leader>ag", "<cmd>AvanteSwitchProvider gemini<CR>", {
        desc = "Avante → Gemini",
      })

      -- Keymaps for chat & edit
      vim.keymap.set("n", "<leader>aa", "<cmd>AvanteAsk<CR>", {
        desc = "Avante: Chat at cursor",
      })
      vim.keymap.set("n", "<leader>ac", "<cmd>AvanteChat<CR>", {
        desc = "Avante: Chat at cursor",
      })
      vim.keymap.set("n", "<leader>ae", "<cmd>AvanteEdit<CR>", {
        desc = "Avante: Edit selection",
      })
    end,
  },

}
