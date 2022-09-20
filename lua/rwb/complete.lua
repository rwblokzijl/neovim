local cmp = require'cmp'

local lspkind = require('lspkind')
lspkind.init()

cmp.setup({
  preselect = cmp.PreselectMode.None,

  view = { entries = { name = 'custom', }, }, -- can be "custom", "wildmenu" or "native"
  snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end, },
  confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false, },
  window = { documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, }, },

  duplicates = {
    nvim_lsp = 1,
    luasnip = 1,
    cmp_tabnine = 1,
    buffer = 1,
    path = 1,
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
      require('cmp_tabnine.compare'),
    },
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<C-y>"] = cmp.mapping(
    cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }, { "i", "c" }
    ),
    ["<c-space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
      )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },
  }),

  sources = cmp.config.sources({
    --      options:
    --        keyword_length
    --        priority
    --        max_item_count
    --        get_bufnrs
    --        more?
    { name = "nvim_lsp", --[[ priority=100 ]] },
    { name = "luasnip",  --[[ priority=90 ]] },
    { name = "nvim_lua", --[[ priority=70 ]] },
    { name = "path",     --[[ priority=60 ]] },
    { name = "buffer",
      --[[ priority=20, ]]
      option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end, },
      max_item_count=4,
    },
    { name = 'cmp_tabnine' ,  --[[ priority=10, ]] },
    { name = "git" },
    { name = "dictionary", keyword_length = 2 },
    { name = 'calc' },
    { name = 'spell' },
  }),

  formatting = {
    format = lspkind.cmp_format ({
      with_text = true,
      mode = 'symbol_text',
      menu = {
        buffer      = "[buf]",
        nvim_lsp    = "[LSP]",
        nvim_lua    = "[api]",
        path        = "[path]",
        luasnip     = "[snip]",
        cmp_tabnine = "[TN]",
        git         = "[git]",
        dictionary  = "[dict]",
        calc        = "[calc]",
        spell       = "[spell]",
      },
    }),
  },

  -- experimental = {
  --   native_menu = false,
  --   -- ghost_text = true,
  -- },

})

-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }
--
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
  exact = 2,
  first_case_insensitive = false,
  document = false,
  document_command = "wn %s -over",
  async = false,
  capacity = 5,
  debug = false,
})

-- https://github.com/petertriho/cmp-git
require("cmp_git").setup({
  filetypes = { "*" },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
    { name = 'conventionalcommits' },
    { name = 'buffer' },
    { name = 'commit' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
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
  repo_list =  {
    -- { "Name of repo", "PATH/TO/FILE.json" }
  }
})

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
  ignored_file_types = { -- default is not to ignore
    -- uncomment to ignore in lua:
    -- lua = true
  };
  show_prediction_strength = true;
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require'lspconfig'

local servers = {

  -- als = {},
  -- angularls = {},
  ansiblels = {},
  -- antlersls = {},
  -- apex_ls = {},
  -- arduino_language_server = {},
  -- asm_lsp = {},
  -- astro = {},
  -- awk_ls = {},
  bashls = {},
  -- beancount = {},
  -- bicep = {},
  -- bsl_ls = {},
  -- ccls = {},
  -- clangd = {},
  -- clarity_lsp = {},
  -- clojure_lsp = {},
  -- cmake = {},
  -- codeqlls = {},
  -- crystalline = {},
  -- csharp_ls = {},
  -- cssls = {},
  -- cssmodules_ls = {},
  -- cucumber_language_server = {},
  -- dartls = {},
  -- denols = {},
  -- dhall_lsp_server = {},
  -- diagnosticls = {},
  dockerls = {},
  -- dotls = {},
  -- efm = {},
  -- elixirls = {},
  -- elmls = {},
  -- ember = {},
  emmet_ls = {},
  -- erlangls = {},
  -- esbonio = {},
  eslint = {},
  -- flow = {},
  -- flux_lsp = {},
  -- foam_ls = {},
  -- fortls = {},
  -- fsautocomplete = {},
  -- fstar = {},
  -- gdscript = {},
  -- ghcide = {},
  -- ghdl_ls = {},
  -- glint = {},
  -- golangci_lint_ls = {},
  -- gopls = {},
  -- gradle_ls = {},
  -- grammarly = {},
  graphql = {},
  -- groovyls = {},
  -- haxe_language_server = {},
  -- hdl_checker = {},
  -- hhvm = {},
  -- hie = {},
  -- hls = {},
  -- hoon_ls = {},
  html = {},
  -- idris2_lsp = {},
  -- intelephense = {},
  -- java_language_server = {},
  -- jdtls = {},
  -- jedi_language_server = {},
  jsonls = {},
  -- jsonnet_ls = {},
  -- julials = {},
  -- kotlin_language_server = {},
  -- lean3ls = {},
  -- leanls = {},
  -- lelwel_ls = {},
  -- lemminx = {},
  -- ltex = {},
  -- m68k = {},
  marksman = {},
  -- metals = {},
  -- mint = {},
  -- mm0_ls = {},
  -- nickel_ls = {},
  -- nimls = {},
  -- ocamlls = {},
  -- ocamllsp = {},
  -- ols = {},
  -- omnisharp = {},
  -- opencl_ls = {},
  -- openscad_ls = {},
  -- pasls = {},
  -- perlls = {},
  -- perlnavigator = {},
  -- perlpls = {},
  -- phan = {},
  -- phpactor = {},
  -- please = {},
  -- powershell_es = {},
  -- prismals = {},
  -- prosemd_lsp = {},
  -- psalm = {},
  -- puppet = {},
  -- purescriptls = {},
  -- pylsp = {},
  -- pyre = {},
  pyright = {},
  -- quick_lint_js = {},
  -- r_language_server = {},
  -- racket_langserver = {},
  -- reason_ls = {},
  -- remark_ls = {},
  -- rescriptls = {},
  -- rls = {},
  -- rnix = {},
  -- robotframework_ls = {},
  -- rome = {},
  -- rust_analyzer = {},
  -- salt_ls = {},
  -- scry = {},
  -- serve_d = {},
  -- sixtyfps = {},
  -- slint_lsp = {},
  -- solang = {},
  -- solargraph = {},
  -- solc = {},
  -- solidity_ls = {},
  -- sorbet = {},
  -- sourcekit = {},
  -- sourcery = {},
  -- spectral = {},
  sqlls = {},
  -- sqls = {},
  -- steep = {},
  -- stylelint_lsp = {},
  sumneko_lua = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' }
      }
    }
  },
  -- svelte = {},
  -- svlangserver = {},
  -- svls = {},
  -- tailwindcss = {},
  -- taplo = {},
  -- teal_ls = {},

  -- terraform_lsp = {
  --   -- Review:
  --   --   - When using a module shows ALL input variables (not just the unfilled ones)
  --   --   - Only when typing only 'local.' shows all local.* options (could be better)
  --   --   - Autocompleted in modules also
  -- },

  terraformls = {
    -- Review:
    --   - When using a module shows just the unfilled variables (better)
    --   - Seems to have a slight startup delay
    --   - When typing only 'l' shows all local.* options (nice)
    --   - Inside a module does work at all recognize 'var.'
  },

  -- texlab = {},
  tflint = {},
  -- theme_check = {},
  -- tilt_ls = {},
  -- tsserver = {},
  -- typeprof = {},
  -- vala_ls = {},
  -- vdmj = {},
  -- verible = {},
  vimls = {},
  -- visualforce_ls = {},
  -- vls = {},
  -- volar = {},
  vuels = {},
  -- wgsl_analyzer = {},
  yamlls = {},
  -- zk = {},
  -- zls = {},
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
  -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
  -- This setting has no relation with the `automatic_installation` setting.

  ensure_installed = { }, -- installation is done automagically

  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Servers are not automatically installed.
  --   - true: All servers set up via lspconfig are automatically installed.
  --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
  automatic_installation = true,
})

local function on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD',    vim.lsp.buf.declaration,    bufopts)
  vim.keymap.set('n', 'gd',    vim.lsp.buf.definition,     bufopts)
  vim.keymap.set('n', 'K',     vim.lsp.buf.hover,          bufopts)
  vim.keymap.set('n', 'gi',    vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set('n', 'gpd', require('goto-preview').goto_preview_definition,      bufopts)
  vim.keymap.set('n', 'gpt', require('goto-preview').goto_preview_type_definition, bufopts)
  vim.keymap.set('n', 'gpi', require('goto-preview').goto_preview_implementation,  bufopts)
  vim.keymap.set('n', 'gP',  require('goto-preview').close_all_win,                bufopts)
  vim.keymap.set('n', 'gpr', require('goto-preview').goto_preview_references,      bufopts)

  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts) vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

for lsp, settings in pairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings,
    flags = {
      debounce_text_changes = 150,
    }
  })
end

require "lsp_signature".setup()

-------
---- LSP lines
-------
--require("lsp_lines").setup(
--  -- TODO: doesn't work. No input accepted, might be worth exploring later in time (today is 20-09-2022)
--  { severity = { min = vim.diagnostic.severity.WARN} }
--  -- Also messes up with using folds
--)
---- vim.diagnostic.config({ virtual_text = false })
---- Might want to do this only for higher severity warnings:
---- vim.diagnostic.config({ virtual_text = {severity = { max = vim.diagnostic.severity.INFO} } })

require('foldsigns').setup()


require('goto-preview').setup {
  default_mappings = true; -- Bind default mappings
}


