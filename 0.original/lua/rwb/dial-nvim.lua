local augend = require("dial.augend")
require("dial.config").augends:register_group {
  -- default augends used when no group name is specified
  default = {
    augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex,     -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.date.alias["%Y/%m/%d"],
    augend.date.alias["%Y-%m-%d"],
    -- augend.date.alias["%d-%m-%Y"],
    augend.date.alias["%m/%d"],
    augend.date.alias["%H:%M"],
    augend.constant.alias.bool,
    augend.constant.new { elements = { "True", "False" } },
    augend.constant.new { elements = { "pull", "triage", "push", "maintain", "admin" } },
    augend.constant.new { elements = {
      "TRACE",
      "DEBUG",
      "INFO",
      "WARNING",
      "ERROR",
      "FATAL",
    } },
    augend.constant.new { elements = {
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
      "Sun",
    } },
    augend.constant.new { elements = {
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    } },
    augend.constant.new { elements = {
      "Zondag",
      "Maandag",
      "Dinsdag",
      "Woensdag",
      "Donderdag",
      "Vrijdag",
      "Zaterdag"
    } },
  },

  --   -- augends used when group with name `mygroup` is specified
  --   mygroup = {
  --     augend.integer.alias.decimal,
  --   }
}
