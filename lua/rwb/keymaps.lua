local M = {}

M.set_lsp_keymaps = function (client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local goto_preview = require('goto-preview')
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD',    vim.lsp.buf.declaration,    bufopts)
  vim.keymap.set('n', 'gd',    vim.lsp.buf.definition,     bufopts)
  vim.keymap.set('n', 'K',     vim.lsp.buf.hover,          bufopts)
  vim.keymap.set('n', 'gi',    vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set('n', 'gpd', goto_preview.goto_preview_definition,      bufopts)
  vim.keymap.set('n', 'gpt', goto_preview.goto_preview_type_definition, bufopts)
  vim.keymap.set('n', 'gpi', goto_preview.goto_preview_implementation,  bufopts)
  vim.keymap.set('n', 'gP',  goto_preview.close_all_win,                bufopts)
  vim.keymap.set('n', 'gpr', goto_preview.goto_preview_references,      bufopts)

  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts) vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

M.set_general_keymaps = function ()

end

return M
