local gitsigns     = require('gitsigns')
local goto_preview = require('goto-preview')
local luasnip      = require('rwb.luasnip').bindings
local nvimtree     = require('rwb.nvimtree')
local telescope    = require('telescope.builtin')
local ls           = require "luasnip"

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

M.set_lsp_keymaps = function (_, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD',    vim.lsp.buf.declaration,                     bufopts)
  vim.keymap.set('n', 'gd',    vim.lsp.buf.definition,                      bufopts)
  vim.keymap.set('n', 'gr',    telescope.lsp_references, bufopts)
  vim.keymap.set('n', 'K',     vim.lsp.buf.hover,                           bufopts)
  vim.keymap.set('n', 'gi',    vim.lsp.buf.implementation,                  bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,                  bufopts)

  -- vim.keymap.set('n', 'gsd', goto_preview.goto_preview_definition,      bufopts)
  -- vim.keymap.set('n', 'gst', goto_preview.goto_preview_type_definition, bufopts)
  -- vim.keymap.set('n', 'gsi', goto_preview.goto_preview_implementation,  bufopts)
  -- vim.keymap.set('n', 'gS',  goto_preview.close_all_win,                bufopts)
  -- vim.keymap.set('n', 'gsr', goto_preview.goto_preview_references,      bufopts)

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
  -- g will mean 'goto'. It is the mode_leader for all jumping through code
  -- gn will mean 'jump to next' and gp ill mean 'jump to previous'

  -- tabs
  --
  nnoremap(leader.."f", function () print("FT: " .. vim.bo.filetype) end)
  nnoremap(leader.."t", ":tabnew<cr>:BufferLineSortByTabs<cr>")
  nnoremap(leader.."T", ":-1tabnew<cr>:BufferLineSortByTabs<cr>")
end

local function set_keymaps_ctrl()
  nnoremap("<c-f>", function () -- live_grep_under_cursor
    -- advantage over grep_string: word can be edited.
    -- If you want to search again over the set, send to quickfix <c-q> and
    -- telescope from quicklist again <c-q>
    telescope.live_grep({default_text=vim.fn.expand("<cword>")})
  end)
  -- nnoremap("<c-f>", telescope.grep_string)
  nnoremap("<c-q>", telescope.quickfix)
  nnoremap("<c-]>", telescope.find_files)
  nnoremap("<c-;>", telescope.find_files)
end

local function set_keymaps_leader(leader)
  nnoremap(leader.."e", nvimtree.toggle)
end

local function set_keymaps_g_text_objects()
    nmap("gcac", "gcic")

    vnoremap("aL", "<Plug>(textobj-line-a)")
    vnoremap("iL", "<Plug>(textobj-line-i)")
    onoremap("aL", "<Plug>(textobj-line-a)")
    onoremap("iL", "<Plug>(textobj-line-i)")
end

-- local function get_visual_selection()
--   local s_start = vim.fn.getpos("'<")
--   local s_end = vim.fn.getpos("'>")
--   local line = vim.fn.getline("'<")
--   print(line)
--   print(vim.inspect(s_start))
--   print(vim.inspect(s_end))
--   return line:sub(s_start[3], s_end[3])
-- end


local function set_keymaps_ft_quickfix()
  vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('QUICKFIX_KEYBINDS', {}),
    pattern = "qf",
    callback = function()
      nnoremap("<leader>r", function ()
        local s = vim.fn.expand("<cword>")
        vim.api.nvim_input(":cfdo %s/".. s .."//g | update<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>")
      end)
      -- vnoremap("<leader>r", function ()
      --   -- vim.cmd("let @s=getline(\"'<\")[getpos(\"'<\")[2]-1:getpos(\"'>\")[2]-1]")
      --   -- local reg = vim.fn.getreg('s')
      --   -- local s = get_visual_selection()
      --   vim.schedule(function ()
      --     vim.api.nvim_input(
      --               ":<bs><bs><bs><bs><bs>let @s=getline(\"'<\")[getpos(\"'<\")[2]-1:getpos(\"'>\")[2]-1]<CR>" ..
      --               ":cfdo %s/<C-r>s//g | update" ..
      --               "<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>"
      --     )
      --   end)
      -- end)
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
  set_keymaps_ctrl()
  set_keymaps_ft_quickfix()

  -- vim.keymap.set({ "i" ,"s", "n"}, "<c-n>", luasnip.next_field, {silent = true})
  -- vim.keymap.set({ "i" ,"s", "n"}, "<c-p>", luasnip.prev_field, {silent = true})
  vim.keymap.set({ "i" --[[,"s"]] --[[,"n"]]}, "<c-l>", luasnip.next_option)
  vim.keymap.set({ "i" --[[,"s"]] --[[,"n"]]}, "<c-h>", luasnip.prev_option)
  vim.keymap.set("i",                          "<c-u>", luasnip.select_choice)
  vim.keymap.set("n",                          "<c-s>", luasnip.reload_snippets)

  local function jump_to_index(hist)
    local item = hist.matches[hist.index]
    vim.api.nvim_win_set_cursor(0, {item.lnum, item.col-1})
  end

  local function mod_plus_1(x, y)
    return math.fmod(x - 1, y) + 1
  end

  local function tbl_find(table, func)
    for i, value in ipairs(table) do
      if func(value) then
        return i
      end
    end
    return -1
  end

  local function lsp_references_jump(history, index_mutator)
    local new_history = {}
    if vim.tbl_isempty(history) then
      local handle_references = function(err, result, context, c)
        -- TODO: port the commented out function below into here
      end

      local params = vim.lsp.util.make_position_params()
      if not params.context then
        params.context = {
          includeDeclaration = true,
        }
      end
      local lsp_call = "textDocument/references"
      local success, err = pcall(vim.lsp.buf_request, 0, lsp_call, params, handle_references)
      if not success then
        error("FAILED")
        error(err)
      end
    else
    end
    return new_history
  end

  -- local function lsp_references_jump(history, index_mutator)
  --   local new_history = {}
  --   if vim.tbl_isempty(history) then
  --     local function on_list(options)
  --       new_history.matches = options.items
  --       local current_pos = vim.api.nvim_win_get_cursor(0)
  --       local current_index = tbl_find(new_history.matches, function (item)
  --         local same_line = item.lnum == current_pos[1]
  --         local same_col = item.col == current_pos[2]+1
  --         local same_file = item.filename == vim.api.nvim_buf_get_name(0)
  --         if same_file and same_line and same_col then
  --           return true
  --         else
  --           return false
  --         end
  --       end)
  --       local lsp_call = "textDocument/references"
  --       local success, _ = pcall(vim.lsp.buf_request, 0, lsp_call, params, lib.get_handler(lsp_call, opts))

  --       new_history.index = mod_plus_1(current_index+1, vim.tbl_count(new_history.matches))
  --       jump_to_index(new_history)
  --     end
  --     vim.lsp.buf.references(nil, {on_list=on_list})
  --   else
  --     new_history.matches = history.matches
  --     new_history.index = mod_plus_1(index_mutator(history.index), vim.tbl_count(history.matches))
  --     jump_to_index(new_history)
  --   end
  --   return new_history
  -- end
  require('nvim-jump-mode').setup({
    jump_modes = {
      lsp_diagnostics = {
        mode_leader = "d", -- gnd/gpd
        next_callback = vim.diagnostic.goto_next,
        prev_callback = vim.diagnostic.goto_prev,
      },
      lsp_references = {
        mode_leader = "r", -- gnh/gph
        pass_history = true,
        next_callback = function(history) return lsp_references_jump(history, function (index) return index + 1 end) end,
        prev_callback = function(history) return lsp_references_jump(history, function (index) return index - 1 end) end,
      },
      git_hunks = {
        mode_leader = "h", -- gnh/gph
        next_callback = function () vim.schedule(function() require('gitsigns').next_hunk() end) end,
        prev_callback = function () vim.schedule(function() require('gitsigns').prev_hunk() end) end,
      },
      luasnip = {
        mode_leader = "s", -- gns/gps
        mappings = {
          next = {
            { modes = {'n', 'i', 's'}, key = "<c-j>" }, -- specify mode specific mappings
          },
          prev = {
            { modes = {'n', 'i', 's'}, key = "<c-k>" },
          },
        },
        next_callback = function() if ls.expand_or_jumpable() then ls.expand_or_jump() end end,
        prev_callback = function() if ls.jumpable(-1) then ls.jump(-1) end end,
      }
    }
  })
end


return M
