local configs = require 'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "all",
  -- rainbow = {
  --   enable = true,
  --   -- list of languages you want to disable the plugin for
  --   -- disable = { "jsx", "cpp" },
  --   -- Which query to use for finding delimiters
  --   -- query = 'rainbow-parens',
  --   -- Highlight the entire buffer all at once
  --   strategy = require 'ts-rainbow'.strategy.global,
  -- },
  -- highlight = { -- enable highlighting
  --   enable = true,
  -- },
  indent = {
    enable = true, -- default is disabled anyways
    disable = { "python", },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = "<c-i>",
      -- node_incremental = "<c-i>",
      -- scope_incremental = "<c-u>",
      -- node_decremental = "<c-o>",
    },
  },
  context_commentstring = {
    enable = true,
  },
  --   commentary_integration = {
  --     -- change default mapping
  --     Commentary = 'gc',
  --     -- disable default mapping
  --     CommentaryLine = false,
  --   },
  -- },
  textobjects = {
    select = {
      enable = true,
      -- lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- ["i?"] = "@attribute.inner",
        -- ["a?"] = "@attribute.outer",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
        ["ir"] = "@call.inner",
        ["ar"] = "@call.outer",
        ["iC"] = "@class.inner",
        ["aC"] = "@class.outer",
        -- ["i?"] = "@comment.inner", -- doesn't exist currently i implement using 'glts/vim-textobj-comment'. Later a custom treesitter query might be userful
        -- ["ic"] = "@comment.inner",
        -- ["ac"] = "@comment.outer",
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
      selection_modes = {
        -- default is charwise 'v'
        -- ["@attribute.inner"]   = 'v',
        -- ["@attribute.outer"]   = 'v',
        -- ["@block.inner"]       = 'v',
        ["@block.outer"]     = 'V',
        -- ["@call.inner"]        = 'v',
        -- ["@call.outer"]        = 'v',
        -- ["@class.inner"]       = 'v',
        ["@class.outer"]     = 'V',
        -- ["@comment.inner"]     = '<c-v>',
        -- ["@comment.outer"]     = '<c-v>',
        -- ["@conditional.inner"] = 'v',
        -- ["@conditional.outer"] = 'v',
        -- ["@frame.inner"]       = 'v',
        -- ["@frame.outer"]       = 'V',
        -- ["@function.inner"]    = 'v',
        ["@function.outer"]  = 'V',   -- disabled because of inline functions
        -- ["@loop.inner"]        = 'v',
        ["@loop.outer"]      = 'V',
        -- ["@parameter.inner"]   = 'v',
        -- ["@parameter.outer"]   = 'v',
        -- ["@scopename.inner"]   = 'v',
        ["@statement.outer"] = 'V',
        -- Your custom capture.
        -- ["aF"] = "@custom-capture",
      }
    },
  },
}

require 'treesitter-context'.setup {
  enable = true,        -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0,        -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'

  zindex = 20,          -- The Z-index of the context window
  mode = 'cursor',      -- Line used to calculate context. Choices: 'cursor', 'topline'
  separator = nil,      -- Separator between context and content. Should be a single character string, like '-'.
}

-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })

vim.opt.foldmethod = 'indent'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
