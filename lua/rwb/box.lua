local ls  = require"luasnip"
local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local txt = ls.text_node
local ins = ls.insert_node
local fun = ls.function_node
local cho = ls.choice_node
local dyn = ls.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt

vim.keymap.set({'n', 'i'}, "<space><space>", function ()
  vim.cmd ':stopinsert'
  vim.cmd ':w'
  vim.cmd ':luafile ~/.config/nvim/lua/rwb/box.lua'
  vim.cmd ':norm gb'
  ls.jump(1)
  ls.jump(-1)
end, {noremap = true})

_G.callback = function(mode)
  print(mode)
end

vim.keymap.set({'n', 'i'}, "<space>f", function ()
  vim.cmd ':stopinsert'
  vim.cmd ':w'
  vim.cmd ':luafile ~/.config/nvim/lua/rwb/box.lua'
  vim.go.operatorfunc = "v:lua.callback"

  vim.api.nvim_feedkeys('g@', 'n', false)
end, {noremap = true})


local function replacor(char)
  return function (args)
    return string.rep(char, args[1][1]:len())
  end
end

local function duplicate(args)
  return args[1][1]
end

local function expand()
  ls.snip_expand(
    ls.snippet(
      "box",
      dyn(1, function ()
        return sn("", fmt(
          "# Placeholder: {}\n" ..
          "#  _{}_\n" ..
          "# < {} >\n" ..
          "#  -{}-\n" ..
          ""
          ,
          {
            ins(1, "TEMP"),
            fun(replacor("_"), {1}),
            fun(duplicate, {1}),
            fun(replacor("-"), {1}),
          }
        ))
      end
      )
    )
  )
end

-- vim.keymap.set({'n', 'i'}, "<space><space>", function ()
--   expand()
-- end, {noremap = true})

















vim.keymap.set('n', "gb", function ()
  expand()
end, {noremap = true})
