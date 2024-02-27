return {
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = vim.defer_fn(function()
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
            lookahead = false,
            keymaps = {
              -- You can use the capture groups defined in the textobjects.scm files
              ["ib"] = "@block.inner",
              ["ab"] = "@block.outer",

              ["if"] = "@call.inner",
              ["af"] = "@call.outer",

              ["i="] = "@assignment.inner",
              ["a="] = "@assignment.outer",
              ["l="] = "@assignment.lhs",
              ["r="] = "@assignment.rhs",

              ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
              ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

              ["i?"] = "@conditional.inner",
              ["a?"] = "@conditional.outer",
              ["??"] = "@conditional.condition",
              ["l?"] = "@conditional.lhs",
              ["r?"] = "@conditional.rhs",

              ["il"] = "@loop.inner",
              ["al"] = "@loop.outer",
              ["hl"] = "@loop.control",
              ["?l"] = "@loop.condition",
              ["ll"] = "@loop.lhs",
              ["rl"] = "@loop.rhs",

              ["in"] = "@number.inner",

              ["ir"] = "@return.inner",
              ["ar"] = "@return.outer",

              ["is"] = "@statement.outer",
              ["as"] = "@statement.outer",

              ['aF'] = '@function.outer',
              ['iF'] = '@function.inner',

              ['aC'] = '@class.outer',
              ['iC'] = '@class.inner',
            },
          },

          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']b'] = '@block.outer',
              [']f'] = '@function.outer',
              [']]'] = '@class.outer',
              [']l'] = '@loop.outer',
              [']?'] = '@conditional.outer',
            },
            goto_next_end = {
              [']B'] = '@block.outer',
              [']F'] = '@function.outer',
              [']['] = '@class.outer',
              [']L'] = '@loop.outer',
            },
            goto_previous_start = {
              ['[b'] = '@block.outer',
              ['[f'] = '@function.outer',
              ['[['] = '@class.outer',
              ['[l'] = '@loop.outer',
              ['[?'] = '@conditional.outer',
            },
            goto_previous_end = {
              ['[B'] = '@block.outer',
              ['[F'] = '@function.outer',
              ['[]'] = '@class.outer',
              ['[L'] = '@loop.outer',
            },
          },

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
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

      -- vim way: ; goes to the direction you were moving.
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      vim.keymap.set({ "n", "x", "o" }, "<home>", function()
        ts_repeat_move.repeat_last_move({forward = false, start = true})
      end)

      -- This repeats the last query with always next direction and to the end of the range.
      vim.keymap.set({ "n", "x", "o" }, "<end>", function()
        ts_repeat_move.repeat_last_move({forward = true, start = false})
      end)


      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)

    end, 0),
    build = ':TSUpdate',
  },

  {
    -- uses nvim-treesitter-textobjects
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
}
