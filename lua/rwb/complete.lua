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

  -- sorting = {
  --   priority_weight = 2,
  --   comparators = {
  --     cmp.config.compare.offset,
  --     cmp.config.compare.exact,
  --     cmp.config.compare.score,
  --     cmp.config.compare.recently_used,
  --     cmp.config.compare.kind,
  --     cmp.config.compare.sort_text,
  --     cmp.config.compare.length,
  --     cmp.config.compare.order,
  --     require('cmp_tabnine.compare'),
  --   },
  -- },

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
    { name = "nvim_lsp",  priority=100, },
    { name = "luasnip" ,  priority=90, },
    { name = "nvim_lua" ,  priority=70, },
    { name = "path" ,  priority=60, },
    { name = "buffer",
      option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end, },
      max_item_count=4,
      priority=20,
    },
    { name = 'cmp_tabnine' ,  priority=10, },
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
      },
    }),
  },

  experimental = {
    -- native_menu = false,
    -- ghost_text = true,
  },

})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
      { name = 'buffer' },
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
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
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
  "jsonls",
  "pyright",
  "terraformls",
  "vimls",
  "yamlls",
  -- "bashls",
  -- "clangd",
  -- "cssls",
  -- "eslint",
  -- "graphql",
  -- "html",
  "sumneko_lua",
  -- "tailwindcss",
  -- "taplo",
  -- "tsserver",
}

local settings = {
  sumneko_lua = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}


lsp_installer.setup({
  ensure_installed = servers,
})

for _, lsp in pairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
    settings = settings[lsp],
    flags = {
      debounce_text_changes = 150,
    }
  })
end
