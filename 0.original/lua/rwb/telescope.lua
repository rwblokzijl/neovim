local actions = require("telescope.actions")

require('telescope').setup {
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
    live_grep = {
      additional_args = function(opts)
        return { "--hidden" }
      end
    },

    find_files = {
      follow = true,
      hidden = true,
      no_ignore = true,
      file_ignore_patterns = {
        "/.terraform/",
        "/.venvs/",
        "^.terraform/",
        "/.git/",
        "^.git/",
        ".cache$",
        "%.o$",
        "%.a$",
        "%.out$",
        "%.class$",
        "%.pdf$",
        "%.mkv$",
        "%.mp4$",
        "%.zip$",

        "MDR-.*.json$",
      },
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
