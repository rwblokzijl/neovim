local ls = require"luasnip"
local snippet = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local txt = ls.text_node
local ins = ls.insert_node
local fun = ls.function_node
local cho = ls.choice_node
local dyn = ls.dynamic_node
local rep = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

-- lsp format (works)
-- ls.add_snippets("terraform", {
--     -- Available in any filetype
--     ls.parser.parse_snippet("project", "project = google_project.$1.project_id$0"),
--   })

-- luasnip format
ls.add_snippets("terraform", {
  snippet(
    {
      trig = "project",
      dscr = "Google project id"
    }, fmt(
    "project = google_project.{}.project_id # project id for {}", {
      ins(1, "project_name"), -- make this a choice node based on the google_projects with treesitter
      rep(1),
    }))
  })



