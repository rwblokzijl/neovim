-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not (cmp_status_ok and snip_status_ok) then return end
local cmp = require'cmp'
local luasnip = require'luasnip'
local lsp_installer = require'nvim-lsp-installer'

local lspkind = require('lspkind')
lspkind.init()

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

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
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[lsnip]",
        -- gh_issues = "[issues]",
        cmp_tabnine = "[TabNine]",
        git = "[git]",
        dictionary = "[dict]",
        calc = "[calc]",
        spell = "[spell]",
      },
    }),
  },

  experimental = {
    native_menu = false,
    -- ghost_text = true,
  },

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
require("cmp_git").setup()

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- ?? it should be one of these, not both
    { name = 'git' },   -- ?? it should be one of these, not both
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
local lsp_flags = {
  debounce_text_changes = 150,
}
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
  jedi_language_server = {},
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
  -- pyright = {},
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
  terraform_lsp = {
    root_dir = lspconfig.util.root_pattern('backend.tf', 'terraform.tfstate', '.terraform', '.git')
  },
  terraformls = {
    -- :h lspconfig-root-detection
    root_dir = lspconfig.util.root_pattern('backend.tf', 'terraform.tfstate', '.terraform', '.git')
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

lsp_installer.setup({
  ensure_installed = servers,
})

for lsp, settings in pairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
    settings = settings,
    flags = {
      debounce_text_changes = 150,
    }
  })
end

require "lsp_signature".setup()

