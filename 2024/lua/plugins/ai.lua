return {
  {
    "github/copilot.vim"
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "cat ".. vim.fn.expand("$HOME") .."/.ssh/openai",
        openai_params = {
          -- model = "gpt-4-turbo",
        },
        openai_edit_params = {
          -- model = "gpt-4-turbo",
        },
        popup_window = {
          win_options = {
          --   foldlevel=0,
          --   wrap = true,
          --   linebreak = true,
          --   foldcolumn = "1",
          --   winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
            foldenable=false
          },
          buf_options = {
            -- filetype = "TelescopeResults",
          },
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }
}

-- local defaults = {
--   system_window = {
--     border = {
--       highlight = "FloatBorder",
--       style = "rounded",
--       text = {
--         top = " SYSTEM ",
--       },
--     },
--     win_options = {
--       wrap = true,
--       linebreak = true,
--       foldcolumn = "2",
--       winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
--     },
--   },
--   popup_input = {
--     prompt = "  ",
--     border = {
--       highlight = "FloatBorder",
--       style = "rounded",
--       text = {
--         top_align = "center",
--         top = " Prompt ",
--       },
--     },
--     win_options = {
--       winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
--     },
--     submit = "<C-Enter>",
--     submit_n = "<Enter>",
--     max_visible_lines = 20,
--   },
--   settings_window = {
--     setting_sign = "  ",
--     border = {
--       style = "rounded",
--       text = {
--         top = " Settings ",
--       },
--     },
--     win_options = {
--       winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
--     },
--   },
--   help_window = {
--     setting_sign = "  ",
--     border = {
--       style = "rounded",
--       text = {
--         top = " Help ",
--       },
--     },
--     win_options = {
--       winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
--     },
--   },
--   openai_params = {
--     model = "gpt-3.5-turbo",
--     frequency_penalty = 0,
--     presence_penalty = 0,
--     max_tokens = 300,
--     temperature = 0,
--     top_p = 1,
--     n = 1,
--   },
--   openai_edit_params = {
--     model = "gpt-3.5-turbo",
--     frequency_penalty = 0,
--     presence_penalty = 0,
--     temperature = 0,
--     top_p = 1,
--     n = 1,
--   },
--   use_openai_functions_for_edits = false,
--   actions_paths = {},
--   show_quickfixes_cmd = "Trouble quickfix",
--   predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
--   highlights = {
--     help_key = "@symbol",
--     help_description = "@comment",
--   },
-- }
--
