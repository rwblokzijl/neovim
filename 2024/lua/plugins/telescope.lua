return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end
    }
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    local actions = require("telescope.actions")
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = {
          --dirs
          "^node_modules/",
          "/node_modules/",
          "^build/",
          "/build/",
          "^dist/",
          "/dist/",
          "^.git/",
          "/.git/",
          "^.terraform/",
          "/.terraform/",
          --files
          "/yarn.lock",
        },

        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ["<esc><esc>"] = actions.close, -- makes closing a lot faster
          },
        },
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    vim.keymap.set('n', '<c-]>', function()
        require('telescope.builtin').find_files({
          hidden = true,
          no_ignore = true
        })
      end,
      { desc = '[S]earch [F]iles', }
    )
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<c-s-f>', function() -- live_grep_under_cursor
        -- advantage over grep_string: word can be edited.
        -- If you want to search again over the set, send to quickfix <c-q> and
        -- telescope from quicklist again <c-q>
        require('telescope.builtin').live_grep({
          default_text = vim.fn.expand("<cword>"),
          additional_args = function(opts) return { "--hidden" } end
        })
      end,
      { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<c-q>', require('telescope.builtin').find_files, { desc = '[Q]uickfix' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

    vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
  end
}
