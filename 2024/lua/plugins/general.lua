return {
  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {},
    config = function ()
      -- document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }
      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
      require('which-key').register({
        ['<leader>'] = { name = 'VISUAL <leader>' },
        ['<leader>h'] = { 'Git [H]unk' },
      }, { mode = 'v' })

    end
  },

  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    'bullets-vim/bullets.vim',
    config = function ()
      -- vim.g.bullets_set_mappings = 0
      -- -- vim.g.bullets_custom_mappings = {
      -- --   -- {'imap', '<cr>', '<Plug>(bullets-newline)'},
      -- --   -- {'inoremap', '<C-cr>', '<cr>'},
      -- --   -- {'nmap', 'o', '<Plug>(bullets-newline)'},
      -- --   -- {'vmap', 'gN', '<Plug>(bullets-renumber)'},
      -- --   -- {'nmap', 'gN', '<Plug>(bullets-renumber)'},
      -- --   -- {'nmap', '<leader>x', '<Plug>(bullets-toggle-checkbox)'},
      -- --   -- {'imap', '<C-t>', '<Plug>(bullets-demote)'},
      -- --   -- {'nmap', '>>', '<Plug>(bullets-demote)'},
      -- --   -- {'vmap', '>', '<Plug>(bullets-demote)'},
      -- --   -- {'imap', '<C-d>', '<Plug>(bullets-promote)'},
      -- --   -- {'nmap', '<<', '<Plug>(bullets-promote)'},
      -- --   -- {'vmap', '<', '<Plug>(bullets-promote)'},
      -- -- }
      --
      -- local opts = {silent = true}  -- Common options for mappings
      --
      -- -- Insert mode mappings
      -- vim.keymap.set('i', '<CR>', '<Plug>(bullets-newline)', opts)
      -- vim.keymap.set('i', '<C-CR>', '<CR>', opts)
      -- vim.keymap.set('i', '<C-t>', '<Plug>(bullets-demote)', opts)
      -- vim.keymap.set('i', '<C-d>', '<Plug>(bullets-promote)', opts)
      --
      -- -- Normal mode mappings
      -- vim.keymap.set('n', 'o', '<Plug>(bullets-newline)', opts)
      -- vim.keymap.set('n', 'gN', '<Plug>(bullets-renumber)', opts)
      -- vim.keymap.set('n', '<leader>x', '<Plug>(bullets-toggle-checkbox)', opts)
      -- vim.keymap.set('n', '>>', '<Plug>(bullets-demote)', opts)
      -- vim.keymap.set('n', '<<', '<Plug>(bullets-promote)', opts)
      --
      -- -- Visual mode mappings
      -- vim.keymap.set('v', 'gN', '<Plug>(bullets-renumber)', opts)
      -- vim.keymap.set('v', '>', '<Plug>(bullets-demote)i', opts)
      -- vim.keymap.set('v', '<', '<Plug>(bullets-promote)i', opts)
    end
  }
}
