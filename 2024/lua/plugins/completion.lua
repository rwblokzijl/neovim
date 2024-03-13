return {
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
      require('mason').setup()
      require('mason-lspconfig').setup()

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
        tflint = {},
      }

      -- Setup neovim lua configuration
      require('neodev').setup()

      -- require('lsp_signature').setup()

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              on_attach(client, bufnr)
              local local_on_attach = (servers[server_name] or {})[on_attach]
              if local_on_attach ~= nil then
                local_on_attach(client, bufnr)
              end
            end,
            settings = (servers[server_name] or {}).settings or {},
            filetypes = (servers[server_name] or {}).filetypes,
            init_options = (servers[server_name] or {}).init_options or {},
          }
        end,
      }
      -- vim.api.nvim_create_autocmd({"BufWritePre"}, {
      --   pattern = {"*.tf", "*.tfvars"},
      --   callback = vim.lsp.buf.format(),
      -- })
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
      'uga-rosa/cmp-dictionary',
      -- 'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',

      'onsails/lspkind-nvim',

      'windwp/nvim-autopairs'
    },
    config = function()
      -- [[ Configure nvim-cmp ]]
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local lspkind = require('lspkind')
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-y>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
        },
        sources = {
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
              buffer     = "[buf]",
              nvim_lsp   = "[LSP]",
              -- nvim_lua   = "[api]",
              path       = "[path]",
              luasnip    = "[snip]",
              -- cmp_tabnine = "[TN]",
              git        = "[git]",
              dictionary = "[dict]",
              calc       = "[calc]",
              spell      = "[spell]",
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
        dic = {
          ["*"] = { "/usr/share/dict/words" },
          ["lua"] = "path/to/lua.dic",
          ["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" },
          filename = {
            ["xmake.lua"] = { "path/to/xmake.dic", "path/to/lua.dic" },
          },
          filepath = {
            ["%.tmux.*%.conf"] = "path/to/tmux.dic"
          },
          spelllang = {
            en = "path/to/english.dic",
          },
        },
        -- The following are default values.
        exact_length = 2,
        first_case_insensitive = false,
        document = {
          enable = false,
          command = { "wn", "${label}", "-over" },
        },
        async = false,
        -- capacity = 5,
        debug = false,
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
    end
  },
  {
    "juliosueiras/vim-terraform-completion",
  },
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        terraform = { 'terraform_fmt' }
      }
    },
  }
}
