vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = "all",
    -- ensure_installed = {
    --   'bash',
    --   'c',
    --   'cpp',
    --   'go',
    --   'javascript',
    --   'lua',
    --   'python',
    --   'rust',
    --   'tsx',
    --   'typescript',
    --   'terraform',
    --   'vim',
    --   'vimdoc',
    -- },


    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,
    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing
    ignore_install = {},
    -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
    modules = {},
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {

      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in the textobjects.scm files
          ["ib"] = "@block.inner",
          ["ab"] = "@block.outer",
          ["if"] = "@call.inner",
          ["af"] = "@call.outer",

          -- ['aa'] = '@parameter.outer',
          -- ['ia'] = '@parameter.inner',
          -- ['aF'] = '@function.outer',
          -- ['iF'] = '@function.inner',
          -- ['ac'] = '@class.outer',
          -- ['ic'] = '@class.inner',
        },
      },

      -- move = {
      --   enable = true,
      --   set_jumps = true, -- whether to set jumps in the jumplist
      --   goto_next_start = {
      --     [']m'] = '@function.outer',
      --     [']]'] = '@class.outer',
      --   },
      --   goto_next_end = {
      --     [']M'] = '@function.outer',
      --     [']['] = '@class.outer',
      --   },
      --   goto_previous_start = {
      --     ['[m'] = '@function.outer',
      --     ['[['] = '@class.outer',
      --   },
      --   goto_previous_end = {
      --     ['[M'] = '@function.outer',
      --     ['[]'] = '@class.outer',
      --   },
      -- },

      -- swap = {
      --   enable = true,
      --   swap_next = {
      --     ['<leader>a'] = '@parameter.inner',
      --   },
      --   swap_previous = {
      --     ['<leader>A'] = '@parameter.inner',
      --   },
      -- },
    },
  }
end, 0)
