local ls = require"luasnip"
local io = require"io"
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

function getLastCharFromString(str)
  return string.sub(str,string.len(str)) or false
end

function comment()
  local comment_string = "#%s"
  -- local comment_string = vim.bo.commentstring:gsub(" ", "")
  return string.format(comment_string, "")
end

function commentLine()
  local comment_string = "#%s"
  -- local comment_string = vim.bo.commentstring:gsub(" ", "")
  local text_len = vim.bo.textwidth ~= 0 and vim.bo.textwidth  or 80
  local comment_len = string.len(comment_string)-2
  local comment_char = getLastCharFromString(comment_string:gsub(" *%%s.*", ""))
  local comment_text = string.rep(comment_char, text_len-comment_len)
  local comment_line = string.format(comment_string, comment_text)
  return comment_line
end

local figlet = function(args)
  return {"asdf", "asdfa", "sdgbk"}
  -- local comment_string = "#%s"
  -- -- local comment_string = vim.bo.commentstring:gsub(" ", "")
  -- local text = args[1][1]
  -- local text_len = vim.bo.textwidth ~= 0 and vim.bo.textwidth  or 80
  -- local comment_len = string.len(comment_string)-2
  -- local handle = io.popen("figlet -c -f slant -w " .. text_len-comment_len .. " " .. text)
  -- if handle == nil then return "..." end
  -- local result = handle:read("*a")
  -- handle:close()
  -- local lines = {}
  -- for line in result:gmatch("[^\r\n]+") do
  --   if(line ~= nil)
  --   then
  --     table.insert(lines, string.format(comment_string, line):match(".*%S") or "")
  --     -- lines:insert(string.format(comment_string, line):match(".*%S") or "")
  --   end
  -- end
  -- return lines
end

local get_file_parent = function()
  return (
    vim.fn.expand('%:p')
    :match(".*/([^/]+)/[^/]+$")
    :gsub("_", " ")
    :gsub("^%l", string.upper)
  )
end

ls.add_snippets("all", {
  snippet("works", dyn(1, function ()
    return sn(nil, fmt("{}", {fun(function () return {"a"} end)}))
  end)),
  snippet("alsoworks",
    fmt("{}", {fun(function () return {"a", "b"} end)})
  ),
  snippet({
    trig="fails",
    docstring="This docstring replaces the preview.\nIt also handles newlines.",
  }, dyn(1, function ()
    return sn(nil, fmt("{}", {fun(function () return {"a", "b"} end)}))
  end)),
})

ls.add_snippets("all", {
  snippet({
    trig="banner",
    docstring = -- workaround for preview not working (https://github.com/L3MON4D3/LuaSnip/issues/491)
    "#########################################\n"..
    "#     ____\n"..
    "#    / __ )____ _____  ____  ___  _____\n"..
    "#   / __  / __ `/ __ \\/ __ \\/ _ \\/ ___/\n"..
    "#  / /_/ / /_/ / / / / / / /  __/ /\n"..
    "# /_____/\\__,_/_/ /_/_/ /_/\\___/_/\n"..
    "#\n"..
    "#########################################\n"..
    "# filename.ext\n"..
    "#########################################\n"
  }, dyn(1, function ()
    return sn("", fmt(
      "{}\n" ..
      "{}\n" ..
      "{}\n" ..
      "{} {}\n" ..
      "{}\n" ..
      "{} Banner text: {}\n" ..
      "\n"
      ,
      {
        fun(commentLine), -- line
        fun(figlet, {1}), -- banner
        fun(commentLine), -- line
        fun(comment), fun(function()
          return vim.fn.expand('%'):match("([^/]+)$") or ""
        end), -- filename
        fun(commentLine), -- line
        fun(comment), ins(1, get_file_parent()), -- input
      }
    ))
  end))
})
