local ls = require "luasnip"

ls.config.set_config {
  history = true, -- This tells LuaSnip to remember to keep around the last snippet. You can jump back into it even if you move outside of the selection

  updateevents = "TextChanged,TextChangedI", -- This one is cool cause if you have dynamic snippets, it updates as you type!

  enable_autosnippets = true, -- Autosnippets:

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  -- ext_opts = {
  --   [types.choiceNode] = {
  --     active = {
  --       virt_text = { { " <- Current Choice", "NonTest" } },
  --     },
  --   },
  -- },
}

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s", "n" }, "<c-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s", "n" }, "<c-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set({
  "i",
  -- "s",
  -- "n"
}, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)
vim.keymap.set({
  "i",
  -- "s",
  -- "n"
}, "<c-h>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<c-s>", "<cmd>source ~/.config/nvim/lua/rwb/luasnip.lua<CR>")

-- Snippets loading
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("snippets/luasnip/*.lua", true)) do
  loadfile(ft_path)()
end


require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
ls.filetype_extend("<ft1>", {"<ft2>"})
ls.filetype_extend("all", { "_" }) -- for honza/vim-snippets


ls.add_snippets("all", {
    -- Available in any filetype
    ls.parser.parse_snippet("expand", "-- This is what was expanded."),
  })

-- lua  = {
--   -- Lua specific snippets
-- }
