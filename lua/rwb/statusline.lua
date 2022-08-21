local colors = require("util.colors")
local utils = require("rwb.utils")

require("scope").setup()
require("bufferline").setup{
  options = {
    mode = "tabs",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    -- -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or level:match("warning") and " " or ""
      return icon .. count
    end,
    -- separator_style = {"", ""},
    -- separator_style =  { '', ''},
    -- separator_style = {'', ''},
    separator_style = "thick",
    -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },

    -- indicator_icon = '',
    buffer_close_icon = '',
    close_icon = '',
    -- modified_icon = '[+]',
    -- left_trunc_marker = '',
    -- right_trunc_marker = '',
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- print(buf.name)
      -- if buf.path == nil then
      --   return
      -- end
      if buf.path:startswith("term://") then
        return
      end
      if buf.name:match('%.tf') then
        return utils.fileParent(buf.path)
      end
    end,
    -- max_name_length = 18,
    -- max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    -- tab_size = 18,
    -- -- NOTE: this will be called a lot so don't do any heavy processing here
    -- custom_filter = function(buf_number, buf_numbers)
    --     -- filter out filetypes you don't want to see
    --     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
    --         return true
    --     end
    --     -- filter out by buffer name
    --     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
    --         return true
    --     end
    --     -- filter out based on arbitrary rules
    --     -- e.g. filter out vim wiki buffer from tabline in your work repo
    --     if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
    --         return true
    --     end
    --     -- filter out by it's index number in list (don't show first buffer)
    --     if buf_numbers[1] ~= buf_number then
    --         return true
    --     end
    -- end,
    offsets = {{filetype = "NvimTree", text = "File Explorer" , text_align = "center"}},
    -- color_icons = true | false, -- whether or not to add the filetype icon highlights
    -- show_buffer_icons = true | false, -- disable filetype icons for buffers
    -- show_buffer_close_icons = true | false,
    -- show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon
    -- show_close_icon = true | false,
    -- show_tab_indicators = true | false,
    -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- -- can also be a table containing 2 custom separators
    -- -- [focused and unfocused]. eg: { '|', '|' }
    -- enforce_regular_tabs = false | true,
    -- always_show_bufferline = true | false,
    -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --     -- add custom logic
    --     return buffer_a.modified > buffer_b.modified
    -- end
  },


  -- :h bufferline-styling
  highlights = {
    modified = colors.getColorComponents("Blue", {bold=true, rev=false}),
    modified_visible = colors.getColorComponents("Blue", {bold=true, rev=false}),
    modified_selected = colors.getColorComponents("Blue", {bold=true, rev=false}),
  }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
