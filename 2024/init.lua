-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('util.string')

require('lazy').setup("plugins", {
  change_detection = {
		notify = false,
	},
})

----- look -----
-- Enable line numbers
vim.o.number = true
vim.o.relativenumber = true

vim.o.wrap = false
vim.o.colorcolumn=80
vim.o.cursorline = true

-- Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.keymap.set('n', '<ESC><ESC>', function ()
  vim.cmd('nohlsearch')
  vim.cmd('hi clear SpellBad')
  require('luasnip').unlink_current()
end, { noremap = true, silent = true })

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

----- Behave -----
vim.o.splitbelow=true
vim.o.splitright=true

vim.o.tabstop=2
vim.o.softtabstop=2
vim.o.shiftwidth=2
vim.o.expandtab=true
vim.o.foldnestmax=1
vim.o.foldmethod="indent"

vim.o.copyindent=true
vim.o.preserveindent=true

-- Disable mouse mode
-- vim.o.mouse = 'a'
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time, default is 4000
vim.o.updatetime = 250
vim.o.timeoutlen = 300

----- Keymaps -----

-- Remap fold to `s` leader instead of `z`
vim.keymap.set('n', 'za', '<Nop>')
vim.keymap.set('n', 'zo', '<Nop>')
vim.keymap.set('n', 'zc', '<Nop>')
vim.keymap.set('n', 'zO', '<Nop>')
vim.keymap.set('n', 'zC', '<Nop>')
vim.keymap.set('n', 'zk', '<Nop>')
vim.keymap.set('n', 'zj', '<Nop>')
vim.keymap.set('n', 'zr', '<Nop>')
vim.keymap.set('n', 'zm', '<Nop>')
vim.keymap.set('n', 'zl', '<Nop>')
vim.keymap.set('n', 'zh', '<Nop>')

vim.keymap.set('n', 's',  '<Nop>')
vim.keymap.set('n', 'ss', 'za')

vim.keymap.set('n', 'sl', 'zo')
vim.keymap.set('n', 'sh', 'zc')
vim.keymap.set('n', 'sL', 'zO')
vim.keymap.set('n', 'sH', 'zC')

vim.keymap.set('n', 'sk', 'zk')
vim.keymap.set('n', 'sj', 'zj')

vim.keymap.set('n', 'sr', 'zr')
vim.keymap.set('n', 'sm', 'zm')
vim.keymap.set('n', 'si', 'zm')
vim.keymap.set('n', 'so', 'zr')



-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
local gs = require('gitsigns')
local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)
local next_diag_repeat, prev_diag_repeat = ts_repeat_move.make_repeatable_move_pair(vim.diagnostic.goto_next, vim.diagnostic.goto_prev)
vim.keymap.set({ "n", "x", "o" }, "]d", next_diag_repeat, { desc = 'Go to previous diagnostic message' })
vim.keymap.set({ "n", "x", "o" }, "[d", prev_diag_repeat, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- TODO: Setup keymaps for copy pasting
vim.keymap.set('n', 'Y', 'y$')

vim.keymap.set('n', '<C-y>', '"+y')
vim.keymap.set('n', '<C-S-y>', '"+y$')
vim.keymap.set('n', '<C-y><C-y>', '"+yy')
vim.keymap.set('v', '<C-y>', '"+y')

vim.keymap.set('n', '<C-p>', '"+p')
vim.keymap.set('n', '<C-S-p>', '"+P')
vim.keymap.set('v', '<C-p>', '"+p')
vim.keymap.set('v', '<C-S-p>', '"+P')

vim.keymap.set('n', '<C-c>', '"+c')
vim.keymap.set('n', '<C-S-c>', '"+C')
vim.keymap.set('n', '<C-c><C-c>', '"+cc')
vim.keymap.set('v', '<C-c>', '"+c')

vim.keymap.set('n', '<C-d>', '"+d')
vim.keymap.set('n', '<C-S-d>', '"+D')
vim.keymap.set('n', '<C-d><C-d>', '"+dd')
vim.keymap.set('v', '<C-d>', '"+d')

vim.keymap.set('v', '<C-v>', '"+p')
vim.keymap.set('v', '<C-S-v>', '"+P')

vim.keymap.set('i', '<C-v>',   "<esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia")
vim.keymap.set('i', '<C-S-v>', "<esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>a")

vim.keymap.set('n', 'ga', "<Plug>(EasyAlign)")
vim.keymap.set('x', 'ga', "<Plug>(EasyAlign)")

-- Tabs control

vim.keymap.set('n', "<TAB>", ":tabn<cr>")
vim.keymap.set('n', "<S-TAB>", ":tabp<cr>")
vim.keymap.set('n', "<C-S-TAB>", ":-tabmove<cr>")
vim.keymap.set('n', "<C-TAB>", ":+tabmove<cr>")

vim.keymap.set('n', "gt", ":tabnew<cr>")
vim.keymap.set('n', "gT", ":-1tabnew<cr>")

vim.keymap.set('n', "1gt", "1gt")
vim.keymap.set('n', "2gt", "2gt")
vim.keymap.set('n', "3gt", "3gt")
vim.keymap.set('n', "4gt", "4gt")
vim.keymap.set('n', "5gt", "5gt")
vim.keymap.set('n', "6gt", "6gt")
vim.keymap.set('n', "7gt", "7gt")
vim.keymap.set('n', "8gt", "8gt")
vim.keymap.set('n', "9gt", "9gt")
vim.keymap.set('n', "10gt", "10gt")
vim.keymap.set('n', "11gt", "11gt")

vim.cmd("cnoreabbrev qq tabclose")

-- Shortcutting split navigation:
vim.keymap.set('n', "gh", ":wincmd h<CR>")
vim.keymap.set('n', "gj", ":wincmd j<CR>")
vim.keymap.set('n', "gk", ":wincmd k<CR>")
vim.keymap.set('n', "gl", ":wincmd l<CR>")

--Turn off arrow keys
vim.keymap.set('n', "<Up>", "<NOP>")
vim.keymap.set('n', "<Down>", "<NOP>")
vim.keymap.set('n', "<Left>", "<NOP>")
vim.keymap.set('n', "<Right>", "<NOP>")

-- make W write one file, not everything (typo is too quick)
vim.cmd([[:command! -nargs=* W :w "<args>"]])
vim.cmd([[:command -nargs=* Q :q "<args>"]])

vim.keymap.set('n', "~", ":AV<cr>", { silent = true })

-- " paste with and without formatting
-- inoremap <C-v>   <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
-- inoremap <C-S-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>a
-- " inoremap <C-b>   <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>a

-- " nnoremap <C-x> "+d
-- " nnoremap <C-S-x> "+D
-- " nnoremap <C-x><C-x> "+dd

local autocmd = vim.api.nvim_create_autocmd
-- local Json = require("json")
autocmd({'BufRead', 'BufWritePost'}, {
  pattern = '',
  callback = function ()
    -- log line to file
    local file = io.open(os.getenv("HOME").."/test.data", "a")
    file:write(
      vim.fn.json_encode({
        time = os.date("!%Y-%m-%dT%T%z"),
        file = vim.fn.expand('%:p'),
        branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
      }).. "\n"
    )
    file:close()
  end
})

