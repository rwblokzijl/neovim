local actions = require("telescope.actions")

require('telescope').setup{
  defaults = {
    -- -- Default configuration for telescope goes here:
    -- -- config_key = value,
    mappings = {
      n = {
        ["<esc>"] = actions.close,
        ["<esc><esc>"] = actions.close,
      },
      i = {
        ["<esc><esc>"] = actions.close,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    find_files = {
      follow = true
    }
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
