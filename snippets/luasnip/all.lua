local ls = require"luasnip"
local io = require"io"
local snippet = ls.snippet
local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local txt = ls.text_node
local ins = ls.insert_node
local fun = ls.function_node
local cho = ls.choice_node
local dyn = ls.dynamic_node
-- local res = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l
-- local postfix = require("luasnip.extras.postfix").postfix
--
function map(tbl, f)
  local t = {}
  for k,v in pairs(tbl) do
    t[k] = f(v)
  end
  return t
end

string.lpad = function(str, len, char)
  if char == nil then char = ' ' end
  return str .. string.rep(char, len - #str)
end

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

function center_text(lines)
  local comment_string = "#%s"
  -- local comment_string = vim.bo.commentstring:gsub(" ", "")
  local lines_len = math.max(unpack(map(lines, function(line) return line:len() end)))
  local text_len = vim.bo.textwidth ~= 0 and vim.bo.textwidth  or 80
  local comment_len = string.len(comment_string)-2
  local out = {}
  for i, line in ipairs(lines) do
    -- table.insert(out, line:lpad(5, " "))
    table.insert(out, string.rep(" ", (text_len-lines_len-comment_len)/2) .. line)
  end
  return out
end

function comment_lines(lines)
  local comment_string = "#%s"
  -- local comment_string = vim.bo.commentstring:gsub(" ", "")
  local out = {}
  for i, line in ipairs(lines) do
    table.insert(out, string.format(comment_string, line))
  end
  return out
end

local cowsay_animals = function ()
  local handle = io.popen("cowsay -l | tail -n +2 | tr ' ' '\n'")
  if handle == nil then return "..." end
  local result = handle:read("*a")
  handle:close()
  local lines = {}
  for line in result:gmatch("[^\r\n]+") do
    if(line ~= nil)
    then
      table.insert(lines, line)
    end
  end
  return lines
end

local cowsay = function(args)
  local text = (args[1] or {})[1] or fileParent() or "Banner"
  local animal = (args[2] or {})[1] or "default"
  local eyes = (args[3] or {})[1] or ""
  local command = (args[4] or {})[1] or "cowsay"
  local handle = io.popen( command .. " " .. eyes .. " -f " .. animal .. " " .. text)
  if handle == nil then return "..." end
  local result = handle:read("*a")
  handle:close()
  local lines = {}
  for line in result:gmatch("[^\r\n]+") do
    if(line ~= nil)
    then
      table.insert(lines, line:match(".*%S") or "")
    end
  end
  return comment_lines(center_text(lines))
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
      table.insert(lines, line:match(".*%S") or "")
    end
  end
  table.insert(lines, commentLine())
  return comment_lines(lines)
end

local cowsay_animal_choice_nodes = function ()
  local out = {}
  table.insert(out, txt("default"))
  for i, animal in ipairs(cowsay_animals()) do
    if(line ~= "default") then
      table.insert(out, txt(animal))
    end
  end
  return out
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
    end)),
  snippet({
    trig="cowsay",
    dscr="It's cowsay...",
  }, dyn(1, function ()
      return sn("", fmt(
        "{} {}\n" ..
        "{} Eyes: {}\n" ..
        "{} Animal: {}\n" ..
        "{} Banner text: {}\n" ..
        "\n" ..
        "{}\n" ..
        "{}\n" ..
        "\n"
        ,
        {
          fun(comment), cho(1, {txt("cowsay"), txt("cowthink")}), -- input
          fun(comment), cho(2, {txt(""), txt("-d"), txt("-b"), txt("-d"), txt("-g"), txt("-p"), txt("-s"), txt("-t"), txt("-w"), txt("-y")}), -- input
          fun(comment), cho(3, cowsay_animal_choice_nodes()), -- input
          fun(comment), ins(4, fileParent()or"Cowsay!!"), -- input
          fun(cowsay, {4, 3, 2, 1}), -- banner
          fun(commentLine), -- line
        }
      ))
    end))
})

-- print(vim.inspect(cowsay_animals()))
