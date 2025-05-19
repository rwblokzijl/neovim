-- vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' })
-- vim.api.nvim_set_hl(0, 'GitSignsAddLn', { link = 'GitSignsAddLn' })
-- vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitSignsAddNr' })
--
-- vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange' })
-- vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'GitSignsChangeLn' })
-- vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitSignsChangeNr' })
--
-- vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' })
-- vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })
-- vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
--
-- vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitSignsDelete' })
-- vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'GitSignsDeleteLn' })
-- vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitSignsDeleteNr' })
--
-- vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' })
-- vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn', { link = 'GitSignsDeleteLn' })
-- vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitSignsDeleteNr' })
return {
  {
    'lewis6991/gitsigns.nvim', -- Adds git related signs to the gutter, as well as utilities for managing changes
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        -- add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        -- change       = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        -- delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        -- topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        -- changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      },
      sign_priority = 100, -- default = 6
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 10,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '  <summary> - <author> (<author_time:%Y-%m-%d>) ',
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end


        -- -- Navigation
        -- map({ 'n', 'v' }, ']c', function()
        --   if vim.wo.diff then
        --     return ']c'
        --   end
        --   vim.schedule(function()
        --     gs.next_hunk()
        --   end)
        --   return '<Ignore>'
        -- end, { expr = true, desc = 'Jump to next hunk' })

        -- map({ 'n', 'v' }, '[c', function()
        --   if vim.wo.diff then
        --     return '[c'
        --   end
        --   vim.schedule(function()
        --     gs.prev_hunk()
        --   end)
        --   return '<Ignore>'
        -- end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = false }
        end, { desc = 'git blame line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>hD', function()
          gs.diffthis '~'
        end, { desc = 'git diff against last commit' })

        -- Toggles
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
    },
  },
  {
    "tpope/vim-fugitive",
    dependencies = {
      "tpope/vim-rhubarb",
      config = function()
        vim.api.nvim_create_user_command(
          'Browse',
          function(opts)
            vim.fn.system { 'xdg-open', opts.fargs[1] }
          end,
          { nargs = 1 }
        )
      end
    }
  },
  {
    "ldelossa/gh.nvim",
    dependencies = {
      {
        "ldelossa/litee.nvim",
        config = function()
          require("litee.lib").setup()
        end,
      },
    },
    config = function()
      require("litee.gh").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }

  }
}
