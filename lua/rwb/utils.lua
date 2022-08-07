local ls = require"luasnip"

TestFunc = function ()
  ls.snip_expand(
    ls.parser.parse_snippet("expand", "-- This is what was expanded.")
  )
end

return {
  TestFunc = TestFunc
}

