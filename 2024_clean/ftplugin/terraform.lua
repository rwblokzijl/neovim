vim.cmd [[autocmd BufWritePre *.tf lua vim.lsp.buf.format()]]

-- vim.opt_local.projectionist_heuristics = {
--     ["*main.tf"] = {
--         alternate= "{}variables.tf"
--     },
--     ["*variables.tf"] = {
--         alternate= "{}outputs.tf"
--     },
--     ["*outputs.tf"] = {
--         alternate= "{}main.tf"
--     },
-- }

vim.opt_local.tabstop=2
vim.opt_local.softtabstop=2
vim.opt_local.shiftwidth=2
vim.opt_local.expandtab=true
vim.opt_local.foldnestmax=1
