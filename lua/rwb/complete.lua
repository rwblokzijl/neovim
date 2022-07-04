-- Setup nvim-cmp.

-- TODO:
-- 1. pretty
-- 2. fix ultisnips
-- 3. fix tabninte complete

local lspkind = require('lspkind')
lspkind.init()

local cmp = require'cmp'

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
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- `luasnip`
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- sorting = {
    --     -- priority_weight = 2,
    --     comparators = {
    --         require('cmp_tabnine.compare'),
    --         cmp.config.compare.offset,
    --         cmp.config.compare.exact,
    --         cmp.config.compare.score,
    --         cmp.config.compare.recently_used,
    --         cmp.config.compare.kind,
    --         cmp.config.compare.sort_text,
    --         cmp.config.compare.length,
    --         cmp.config.compare.order,
    --     },
    -- },
    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<c-y>"] = cmp.mapping(
        cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        { "i", "c" }
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

        -- ["<tab>"] = false,
        ["<tab>"] = cmp.config.disable,

        -- ["<tab>"] = cmp.mapping {
        --   i = cmp.config.disable,
        --   c = function(fallback)
        --     fallback()
        --   end,
        -- },

        -- Testing
        ["<c-q>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },

        -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        -- ['<C-e>'] = cmp.mapping.abort(),
        -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        -- If you want tab completion :'(
        --  First you have to just promise to read `:help ins-completion`.
        --
        -- ["<Tab>"] = function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   else
        --     fallback()
        --   end
        -- end,
        -- ["<S-Tab>"] = function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   else
        --     fallback()
        --   end
        -- end,
    }),
    sources = cmp.config.sources({
        --      options:
        --        keyword_length
        --        priority
        --        max_item_count
        --        get_bufnrs
        --        more?
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "ultisnips" },
        { name = 'cmp_tabnine' },
        { name = "buffer", get_bufnrs = function() return vim.api.nvim_list_bufs() end },
        -- { name = "buffer", keyword_length = 3 },
    }),
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            mode = 'symbol_text',
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[lsnip]",
                ultisnips = "[usnip]",
                -- gh_issues = "[issues]",
                cmp_tabnine = "[TabNine]",
            },
        },
    },
    experimental = {
        native_menu = false,
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
    show_prediction_strength = false;
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
    capabilities = capabilities,
    -- on_attach = on_attach,
    -- cmd = {"pipenv run pyright-langserver --stdio"}
}
require'lspconfig'['terraformls'].setup {
    capabilities = capabilities,
    cmd = { "terraform-lsp" }

}
