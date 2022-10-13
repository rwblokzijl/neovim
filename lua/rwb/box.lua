local ls  = require"luasnip"
local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local txt = ls.text_node
local ins = ls.insert_node
local fun = ls.function_node
local cho = ls.choice_node
local dyn = ls.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt

-- vim.keymap.set({'n', 'i'}, "<space><space>", function ()
--   vim.cmd ':stopinsert'
--   vim.cmd ':w'
--   vim.cmd ':luafile ~/.config/nvim/lua/rwb/box.lua'
--   vim.cmd ':norm gb'
--   ls.jump(1)
--   ls.jump(-1)
-- end, {noremap = true})

_G.callback = function(mode)
  print(mode)
end



-- vim.keymap.set({'n', 'i'}, "<space>f", function ()
--   vim.cmd ':stopinsert'
--   vim.cmd ':w'
--   vim.cmd ':luafile ~/.config/nvim/lua/rwb/box.lua'

--   vim.go.operatorfunc = "v:lua.callback"
--   vim.api.nvim_feedkeys('g@', 'n', false)
-- end, {noremap = true})


local function replacor(char)
  return function (args)
    return string.rep(char, args[1][1]:len())
  end
end

local function make_line(line, chars, desired_width)
  -- local chars_len = chars[1]:len() + 1 + 1 chars[2]:len()
  local pad = math.max(0, desired_width-line:len() )
  return chars[1] .. " " .. line .. string.rep(" ", pad) .. " " .. chars[2]
end

local function top_bot_line(char, desired_width)
  return " " .. string.rep(char, desired_width +2) .. " "
end

local function get_width(lines)
  return math.max(unpack(vim.tbl_map(function (line) return line:len() end, lines)))
end

local function uncomment(text, comment_string)
  local line = string.gmatch(text,
    comment_string
      :gsub("%%s", "(.*)")
  )() or text
  if line:match("^"..comment_string -- return nothing if empty comment (minus trailing spaces)
    :gsub("%%s", "")
    :gsub(" ", "").."$"
  ) then
    return ""
  end
  return line
end

local function box_func(args, _, comment_string)
  local lines = args[1]
  local ans = {}
  local width = get_width(lines)
  table.insert(ans, top_bot_line("_", width))
  if #lines == 1 then
    table.insert(ans, "< " .. lines[1] .. " >")
  else
    for i, line in ipairs(lines) do
      line = uncomment(line, comment_string)
      if i == 1 then
        line = make_line(line, {"/", "\\"}, width)
      elseif i == #lines then
        line =  make_line(line, {"\\", "/"}, width)
      else
        line =  make_line(line, {"|", "|"}, width)
      end
      table.insert(ans, line)
    end
  end
  table.insert(ans, top_bot_line("-", width))
  return vim.tbl_map(function (line)
    return comment_string:format(line):gsub(" *$", "")
  end, ans)
end

-- llsldkfjsldkf
-- lksdjflksdjf

--  _________________
-- / llsldkfjsldkf   \
-- \ lksdjflksdjf    /
--  -----------------

local function get_comment_string()
  return vim.bo.commentstring:gsub(" ?%%s ?", " %%s "):gsub(" *$", "")
end

local function expand()
  ls.snip_expand(
    ls.snippet(
      "box",
      dyn(1, function ()
        local comment_string =  get_comment_string()
        print(comment_string)
        return sn("", fmt(
          comment_string:format("{}") .. "\n" ..
          "\n" ..
          "{}\n" ..
          ""
          ,
          {
            ins(1, "Box text"),
            fun(box_func, {1}, {user_args = {comment_string}}),
          }
        ))
      end
      )
    )
  )
end




























vim.keymap.set('n', "gb", function ()
  expand()
end, {noremap = true})
