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
}

