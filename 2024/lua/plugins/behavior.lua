return {
  -- Useful plugin to show you pending keybinds.
  -- {
  --   'folke/which-key.nvim',
  --   opts = {},
  --   config = function()
  --     -- document existing key chains
  --     require('which-key').register {
  --       ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  --       ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  --       ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  --       ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
  --       ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  --       ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  --       ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
  --       ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
  --     }
  --     -- register which-key VISUAL mode
  --     -- required for visual <leader>hs (hunk stage) to work
  --     require('which-key').register({
  --       ['<leader>'] = { name = 'VISUAL <leader>' },
  --       ['<leader>h'] = { 'Git [H]unk' },
  --     }, { mode = 'v' })
  --   end
  -- },
  {
    'lukas-reineke/indent-blankline.nvim',
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
    init = function()
      vim.g.bullets_set_mappings = 0
      vim.g.bullets_custom_mappings = {
        { 'imap',     '<cr>',      '<Plug>(bullets-newline)' },
        { 'inoremap', '<C-cr>',    '<cr>' },
        { 'imap',     '<C-t>',     '<Plug>(bullets-demote)' },
        { 'imap',     '<C-d>',     '<Plug>(bullets-promote)' },

        { 'nmap',     'o',         '<Plug>(bullets-newline)' },
        { 'nmap',     '<leader>x', '<Plug>(bullets-toggle-checkbox)' },
        { 'nmap',     '>>',        '<Plug>(bullets-demote)' },
        { 'nmap',     '<<',        '<Plug>(bullets-promote)' },

        { 'nmap',     'gN',        '<Plug>(bullets-renumber)' },
        { 'vmap',     'gN',        '<Plug>(bullets-renumber)' },

        { 'vmap',     '>',         '<Plug>(bullets-demote)gv' },  -- changed to maintain selection after
        { 'vmap',     '<',         '<Plug>(bullets-promote)gv' }, -- changed to maintain selection after
      }
      vim.g.bullets_checkbox_markers = '    x'
      vim.g.bullets_checkbox_partials_toggle = 0
    end,
    config = function()
    end
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  {
    'Wansmer/treesj',
    keys = { '<space>m', '<space>j', '<space>s' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require('treesj').setup({ --[[ your config ]] })
    end,
  }
}
