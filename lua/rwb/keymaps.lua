local M = {}

local function nnoremap(binding, command)
  vim.keymap.set('n', binding, command, {noremap = true})
end

local function onoremap(binding, command)
  vim.keymap.set('o', binding, command, {noremap = true})
end

local function vnoremap(binding, command)
  vim.keymap.set('v', binding, command, {noremap = true})
end

local function nmap(binding, command)
  vim.keymap.set('n', binding, command)
end

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

local function set_keymaps_g_fold(leader)

  nnoremap('za', '<Nop>')
  nnoremap('zo', '<Nop>')
  nnoremap('zc', '<Nop>')
  nnoremap('zO', '<Nop>')
  nnoremap('zC', '<Nop>')
  nnoremap('zk', '<Nop>')
  nnoremap('zj', '<Nop>')
  nnoremap('zr', '<Nop>')
  nnoremap('zm', '<Nop>')
  nnoremap('zl', '<Nop>')
  nnoremap('zh', '<Nop>')

  nnoremap(leader..'',  '<Nop>')
  nnoremap(leader..'s', 'za')

  nnoremap(leader..'l', 'zo')
  nnoremap(leader..'h', 'zc')
  nnoremap(leader..'L', 'zO')
  nnoremap(leader..'H', 'zC')

  nnoremap(leader..'k', 'zk')
  nnoremap(leader..'j', 'zj')
  nnoremap(leader..'r', 'zr')
  nnoremap(leader..'m', 'zm')
end

local function set_keymaps_g_goto(leader)
  -- g will mean 'goto'. It is the prefix for all jumping through code
  -- gn will mean 'jump to next' and gp ill mean 'jump to previous'

  -- tabs
  nnoremap(leader.."f", function () print("FT: " .. vim.bo.filetype) end)
  nnoremap(leader.."t", ":tabnew<cr>:BufferLineSortByTabs<cr>")
  nnoremap(leader.."T", ":-1tabnew<cr>:BufferLineSortByTabs<cr>")

  -- diagnostics
  nnoremap(leader.."nd", vim.diagnostic.goto_next)
  nnoremap(leader.."pd", ":-1tabnew<cr>:BufferLineSortByTabs<cr>")
end

local function set_keymaps_g_ctrl()
  nnoremap("<c-f>", function () -- live_grep_under_cursor
    -- advantage over grep_string: word can be edited.
    -- If you want to search again over the set, send to quickfix <c-q> and
    -- telescope from quicklist again <c-q>
    require'telescope.builtin'.live_grep({default_text=vim.fn.expand("<cword>")})
  end)
  -- nnoremap("<c-f>", require'telescope.builtin'.grep_string)
  nnoremap("<c-q>", require'telescope.builtin'.quickfix)
  nnoremap("<c-]>", require('telescope.builtin').find_files)
  nnoremap("<c-;>", require('telescope.builtin').find_files)
end

local function set_keymaps_leader(leader)
  vim.keymap.set("n", leader.."e", require('rwb.nvimtree').toggle)
end

local function set_keymaps_g_text_objects()
    nmap("gcac", "gcic")

    vnoremap("aL", "<Plug>(textobj-line-a)")
    vnoremap("iL", "<Plug>(textobj-line-i)")
    onoremap("aL", "<Plug>(textobj-line-a)")
    onoremap("iL", "<Plug>(textobj-line-i)")
end

local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local line = vim.fn.getline("'<")
  print(line)
  print(vim.inspect(s_start))
  print(vim.inspect(s_end))
  return line:sub(s_start[3], s_end[3])
end


local function set_keymaps_ft_quickfix()
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('QUICKFIX_KEYBINDS', {}),
    pattern = "qf",
    callback = function()
      nnoremap("<leader>r", function ()
        local s = vim.fn.expand("<cword>")
        vim.api.nvim_input(":cfdo %s/".. s .."//g | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>")
      end)
      vnoremap("<leader>r", function ()
        -- vim.cmd("let @s=getline(\"'<\")[getpos(\"'<\")[2]-1:getpos(\"'>\")[2]-1]")
        -- local reg = vim.fn.getreg('s')
        local s = get_visual_selection()
        vim.schedule(function ()
          vim.api.nvim_input(
                    ":<bs><bs><bs><bs><bs>let @s=getline(\"'<\")[getpos(\"'<\")[2]-1:getpos(\"'>\")[2]-1]<CR>" ..
                    ":cfdo %s/<C-r>s//g | update" ..
                    "<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>"
          )
        end)
      end)
        -- vim.api.nvim_input(":cfdo %s/".. s .."//g | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>")-- , true, false, true)
        -- vnoremap <Leader>R
    end
  })
end

M.set_general_keymaps = function ()
  vim.keymap.set('n', '<SPACE>', '<Nop>', {noremap = true})
  vim.g.mapleader = " "

  set_keymaps_g_text_objects()
  set_keymaps_leader("<leader>")
  set_keymaps_g_fold("s")
  set_keymaps_g_goto("g")
  set_keymaps_g_ctrl()
  set_keymaps_ft_quickfix()

end


return M
