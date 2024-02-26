vim.g.better_whitespace_enabled = 1
vim.g.strip_max_file_size       = 10000
vim.g.strip_whitespace_confirm  = 0
-- vim.g.strip_whitespace_on_save  = 1
vim.cmd("autocmd BufWritePre * :%s/\\s\\+$//e")


