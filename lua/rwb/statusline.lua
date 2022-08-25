local colors = require("util.colors")

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

-- local inspect = function (x)
--   print(vim.inspect(x))
-- end

local red = {
  fg = "#ff0000",
  bg = "#00ff00",
}

-- require("scope").setup()
require("bufferline").setup {
  options = {
    mode = "tabs",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    -- -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    diagnostics_indicator = function(count, level)
      local icons = {
        error   = " ",
        warning = " ",
        info    = " ",
        hint    = "",
      }
      return icons[level] .. count
    end,
    -- separator_style = {"right_of_active", "right_of_inactive"} --     
    separator_style = {"", ""},
    indicator = {
      -- style = "icon",
      icon = "", -- Effectively the left seperator for the active tab
    },
    left_trunc_marker = '',
    right_trunc_marker = '',

    -- modified_icon = '█',  buffer_close_icon = '█',
    -- modified_icon = '█',  buffer_close_icon = '█',
    -- modified_icon = '█',  buffer_close_icon = '█',
    -- modified_icon = '█ ', buffer_close_icon = '█ ',
    modified_icon = '█ ', buffer_close_icon = '█ ',
    -- modified_icon = '█ ', buffer_close_icon = '█ ',
    close_icon = 'CLOSE',
    show_close_icon = false,
    -- show_buffer_close_icons = false,
    tab_size = 20,
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      local tabinfo = vim.fn.gettabinfo(buf.tabnr)
      if next(tabinfo) == nil then return end
      local windows = tabinfo[1].windows
      local bufs = {}
      for _, window in ipairs(windows) do
        local buf_nr = vim.fn.winbufnr(window)
        local buf_info = vim.fn.getbufinfo(buf_nr)[1]
        table.insert(bufs, buf_info)
      end
      local modified = false
      for _, buf_info in ipairs(bufs) do
        if buf_info.changed == 1 then
          modified = true
        end
      end
      local name = ""
      for _, buf_info in ipairs(bufs) do
        if buf_info.name:match(".*NvimTree_%d*$") then -- Dont change name for nvimtree
          print("NO TREE")
          goto continue
        elseif buf_info.name:startswith("term://") then -- Dont change name for fzf
          print("NO TERM")
          goto continue
        elseif buf_info.name:match('%.tf') then
          name = buf_info.name:path_parent()
          break
        else
          print("Other")
          name = buf_info.name:basename() or buf.name
          print(name)
          break
        end
        ::continue::
      end
      print(name)
      print("---")
      return name .. (modified and ' [+]' or '')
    end,
    offsets = {
      {filetype = "NvimTree", text = "0. פּ File Explorer" , text_align = "left", highlight="lualine_b_normal"},
    },
    -- color_icons = true | false, -- whether or not to add the filetype icon highlights
    -- show_buffer_icons = true | false, -- disable filetype icons for buffers
    -- show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon
    -- show_tab_indicators = true,
    -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  },

  -- :h bufferline-styling
  highlights = {
    modified              = colors.getTransisionColors("lualine_b_normal", "lualine_c_inactive"),
    modified_visible      = red,
    modified_selected     = colors.getTransisionColors("lualine_a_normal", "lualine_c_inactive"),

    close_button          = colors.getTransisionColors("lualine_b_normal", "lualine_c_inactive"),
    close_button_visible  = red,
    close_button_selected = colors.getTransisionColors("lualine_a_normal", "lualine_c_inactive"),

    separator             = colors.getTransisionColors("lualine_c_inactive", "lualine_b_normal"),
    separator_visible     = red,
    separator_selected    = colors.getTransisionColors("lualine_a_normal", "lualine_c_inactive"),
    indicator_selected    = colors.getTransisionColors("lualine_b_normal", "lualine_a_normal"),

    numbers               = colors.getColorComponents("lualine_b_normal"),
    numbers_visible       = red,
    numbers_selected      = colors.getColorComponents("lualine_a_normal"),

    background            = colors.getColorComponents("lualine_b_normal"),
    fill                  = colors.getColorComponents("lualine_c_inactive"),

    buffer                = red,
    buffer_visible        = red,
    buffer_selected       = colors.getColorComponents("lualine_a_normal"),

    -- diagnostic                  =
    -- diagnostic_visible          = red,
    -- diagnostic_selected         =

    hint                        = colors.getColorComponents("lualine_b_normal"),
    hint_visible                = red,
    hint_selected               = colors.getColorComponents("lualine_a_normal"),
    hint_diagnostic             = colors.getCombinedColors("DiagnosticHint", "lualine_b_normal"),
    hint_diagnostic_visible     = red,
    hint_diagnostic_selected    = colors.getColorComponents("lualine_a_normal"),
    info                        = colors.getColorComponents("lualine_b_normal"),
    info_visible                = red,
    info_selected               = colors.getColorComponents("lualine_a_normal"),
    info_diagnostic             = colors.getCombinedColors("DiagnosticInfo", "lualine_b_normal"),
    info_diagnostic_visible     = red,
    info_diagnostic_selected    = colors.getColorComponents("lualine_a_normal"),
    warning                     = colors.getColorComponents("lualine_b_normal"),
    warning_visible             = red,
    warning_selected            = colors.getColorComponents("lualine_a_normal"),
    warning_diagnostic          = colors.getCombinedColors("DiagnosticWarn", "lualine_b_normal"),
    warning_diagnostic_visible  = red,
    warning_diagnostic_selected = colors.getColorComponents("lualine_a_normal"),
    error                       = colors.getColorComponents("lualine_b_normal"),
    error_visible               = red,
    error_selected              = colors.getColorComponents("lualine_a_normal"),
    error_diagnostic            = colors.getCombinedColors("DiagnosticError", "lualine_b_normal"),
    error_diagnostic_visible    = red,
    error_diagnostic_selected   = colors.getColorComponents("lualine_a_normal"),

    tab                   = red,
    tab_selected          = red,
    tab_close             = red,

    duplicate                   = red,
    duplicate_visible           = red,
    duplicate_selected          = red,

    pick                        = red,
    pick_visible                = red,
    pick_selected               = red,

  }
}
