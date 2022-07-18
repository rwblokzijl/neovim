local ls = require"luasnip"
local io = require"io"
local snippet = ls.snippet
local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local txt = ls.text_node
local ins = ls.insert_node
local fun = ls.function_node
-- local cho = ls.choice_node
local dyn = ls.dynamic_node
-- local res = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l
-- local postfix = require("luasnip.extras.postfix").postfix

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

function fileParent()
  local file_path = vim.fn.expand('%:p')
  if file_path == "" then
    return nil
  end
  return (
    file_path
    :match(".*/([^/]+)/[^/]+$")
    :gsub("_", " ")
    :gsub("^%l", string.upper)
  )
end

function fileName()
  return vim.fn.expand('%'):match("([^/]+)$") or ""
end


local figlet = function(args)
  local comment_string = "#%s"
  -- local comment_string = vim.bo.commentstring:gsub(" ", "")
  local text = (args[1] or {})[1] or fileParent() or "Banner"
  local text_len = vim.bo.textwidth ~= 0 and vim.bo.textwidth  or 80
  local comment_len = string.len(comment_string)-2
  local handle = io.popen("figlet -c -f slant -w " .. text_len-comment_len .. " " .. text)
  if handle == nil then return "..." end
  local result = handle:read("*a")
  handle:close()
  local lines = {}
  table.insert(lines, commentLine())
  for line in result:gmatch("[^\r\n]+") do
    if(line ~= nil)
    then
      table.insert(lines, string.format(comment_string, line):match(".*%S") or "")
      -- lines:insert(string.format(comment_string, line):match(".*%S") or "")
    end
  end
  table.insert(lines, commentLine())
  return lines
end

ls.add_snippets("all", {
  snippet(
    {
      trig="banner",
      dscr="Banner from function name",
    }, fmt(
      "{}\n" ..
      "{} {}\n" ..
      "{}\n" ..
      "\n"
      ,
      {
        fun(figlet), -- banner
        fun(comment), fun(fileName), -- filename
        fun(commentLine), -- line
      }
    )),
  snippet({
    trig="bannerc",
    dscr="Banner with custom text",
    -- docstring = -- workaround for preview not working (https://github.com/L3MON4D3/LuaSnip/issues/491) -- got fixed very fast
    --   "#########################################\n"..
    --   "#     ____\n"..
    --   "#    / __ )____ _____  ____  ___  _____\n"..
    --   "#   / __  / __ `/ __ \\/ __ \\/ _ \\/ ___/\n"..
    --   "#  / /_/ / /_/ / / / / / / /  __/ /\n"..
    --   "# /_____/\\__,_/_/ /_/_/ /_/\\___/_/\n"..
    --   "#\n"..
    --   "#########################################\n"..
    --   "# filename.ext\n"..
    --   "#########################################\n"
  }, dyn(1, function ()
      return sn("", fmt(
        "{}\n" ..
        "{} {}\n" ..
        "{}\n" ..
        "{} Banner text: {}\n" ..
        "\n"
        ,
        {
          fun(figlet, {1}), -- banner
          fun(comment), fun(fileName), -- filename
          fun(commentLine), -- line
          fun(comment), ins(1, fileParent()or"Banner"), -- input
        }
      ))
    end))
})
