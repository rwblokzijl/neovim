local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "all",
  highlight = { -- enable highlighting
    enable = true,
  },
  indent = {
    enable = true, -- default is disabled anyways
    disable = {"python", },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-i>",
      node_incremental = "<c-i>",
      scope_incremental = "<c-u>",
      node_decremental = "<c-o>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      -- lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- ["i?"] = "@attribute.inner",
        -- ["a?"] = "@attribute.outer",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
        -- ["i?"] = "@call.inner",
        -- ["a?"] = "@call.outer",
        ["iC"] = "@class.inner",
        ["aC"] = "@class.outer",
        -- ["i?"] = "@comment.inner", -- doesn't exist currently i implement using 'glts/vim-textobj-comment'. Later a custom treesitter query might be userful
        ["ac"] = "@comment.outer",
        -- ["i?"] = "@conditional.inner",
        -- ["a?"] = "@conditional.outer",
        -- ["i?"] = "@frame.inner",
        -- ["a?"] = "@frame.outer",
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
        ["iA"] = "@parameter.inner",
        ["aA"] = "@parameter.outer",
        -- ["i?"] = "@scopename.inner",
        ["as"] = "@statement.outer", ["is"] = "@statement.outer",

        -- Your custom capture.
        -- ["aF"] = "@custom-capture",
      },
    },
  },
}

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
      'class',
      'function',
      'method',
      'for',
      'while',
      'if',
      'switch',
      'case',
      -- 'block',
    },
    -- Example for a specific filetype.
    -- If a pattern is missing, *open a PR* so everyone can benefit.
    --   rust = {
    --       'impl_item',
    --   },
    lua = {
      'field'
    }
  },
  exact_patterns = {
    -- Example for a specific filetype with Lua patterns
    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
    -- exactly match "impl_item" only)
    -- rust = true,
  },

  -- [!] The options below are exposed but shouldn't require your attention,
  --     you can safely ignore them.

  zindex = 20, -- The Z-index of the context window
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
}

-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })

vim.opt.foldmethod     = 'indent'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'

