local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = "all",
  highlight = { -- enable highlighting
    enable = true,
  },
  indent = {
    enable = true, -- default is disabled anyways
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
