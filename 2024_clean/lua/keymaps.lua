local M = {}

M.set_general_keymaps = function ()
  -- TODO: Setup keymaps for copy pasting
  -- nnoremap Y y$

  -- nnoremap <C-y> "+y
  -- nnoremap <C-S-y> "+y$
  -- nnoremap <C-y><C-y> "+yy
  -- vnoremap <C-y> "+y

  -- nnoremap <C-p> "+p
  -- nnoremap <C-S-p> "+P
  -- vnoremap <C-p> "+p
  -- vnoremap <C-S-p> "+P

  -- nnoremap <C-c> "+c
  -- nnoremap <C-S-c> "+C
  -- nnoremap <C-c><C-c> "+cc
  -- vnoremap <C-c> "+c

  -- nnoremap <C-d> "+d
  -- nnoremap <C-S-d> "+D
  -- nnoremap <C-d><C-d> "+dd
  -- vnoremap <C-d> "+d

  -- vnoremap <C-v> "+p
  -- vnoremap <C-S-v> "+P
  -- " paste with and without formatting
  -- inoremap <C-v>   <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
  -- inoremap <C-S-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>a
  -- " inoremap <C-b>   <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>a

  -- " nnoremap <C-x> "+d
  -- " nnoremap <C-S-x> "+D
  -- " nnoremap <C-x><C-x> "+dd
end

return M
