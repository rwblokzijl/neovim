return {
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} }, -- Also comments blank lines
 -- { 'tpope/vim-commentary', }, -- Does not comment blank lines

  {
    "christoomey/vim-sort-motion",
    config = function ()
      -- vim.g.sort_motion_flags = "ui"
    end
  },
  {
    "vim-scripts/ReplaceWithRegister",
  },
  {
    "junegunn/vim-easy-align",
  },
  {
    "monaqa/dial.nvim",
    config = function ()
      local augend = require("dial.augend")
      local map = require("dial.map")
      require("dial.config").augends:register_group{
        -- default augends used when no group name is specified
        default = {
          augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias["%Y/%m/%d"],
          augend.date.alias["%Y-%m-%d"],
          -- augend.date.alias["%d-%m-%Y"],
          augend.date.alias["%m/%d"],
          augend.date.alias["%H:%M"],
          augend.constant.alias.bool,
          augend.constant.new{ elements = {"True", "False"} },
          augend.constant.new{ elements = {"pull", "triage", "push", "maintain", "admin"} },
          augend.constant.new{ elements = {
            "Mon",
            "Tue",
            "Wed",
            "Thu",
            "Fri",
            "Sat",
            "Sun",
          }},
          augend.constant.new{ elements = {
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday",
            "Sunday",
          }},
          augend.constant.new{ elements = {
            "Zondag",
            "Maandag",
            "Dinsdag",
            "Woensdag",
            "Donderdag",
            "Vrijdag",
            "Zaterdag"
          }},
        },
        --   -- augends used when group with name `mygroup` is specified
        --   mygroup = {
        --     augend.integer.alias.decimal,
        --   }
      }

      vim.keymap.set('n', "<C-a>", map.inc_normal())
      vim.keymap.set('n', "<C-x>", map.dec_normal())
      vim.keymap.set('v', "<C-a>", map.inc_visual())
      vim.keymap.set('v', "<C-x>", map.dec_visual())
      vim.keymap.set('v', "g<C-a>", map.inc_gvisual())
      vim.keymap.set('v', "g<C-x>", map.dec_gvisual())
    end
  }
}
