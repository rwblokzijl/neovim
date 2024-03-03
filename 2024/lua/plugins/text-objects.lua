-- More text objects
-- use 'nvim-treesitter/nvim-treesitter-textobjects' -- Set of treesitter based objects
-- use 'chrisgrieser/nvim-various-textobjs'  -- Set of objects
-- indentation          |  [ai][iI] | all         | surrounding lines with same or higher indentation                                 | see overview from vim-indent-object
-- restOfIndentation    |  R        | all         | lines down with same or higher indentation                                        | see overview from vim-indent-object
-- value                |  iv, av   | all         | value of key-value pair, or right side of a variable assignment (inside one line) | outer includes trailing commas or semicolons
-- key                  |  ik, ak   | all         | key of key-value pair, or left side of a variable assignment                      | outer includes the = or :
-- number               |  in, an   | all         | numbers, similar to <C-a>                                                         | inner: digits, outer: incl. minus and decimal
-- diagnostic           |  !        | all         | LSP diagnostic (requires built-in LSP)                                            | -
-- nearEoL              |  n        | all         | from cursor position to end of line, minus one character                          | -
-- mdlink               |  il, al   | md, toml    | markdown link like [title](url)                                                   | inner is only the link title (between the [])
-- mdFencedCodeBlock    |  iC, aC   | md          | markdown fenced code (enclosed by three backticks)                                | outer includes the enclosing backticks
-- cssSelector          |  ic, ac   | css, scss   | class in CSS, like .my-class                                                      | outer includes trailing comma and space
-- jsRegex              |  i/, a/   | js, ts      | JavaScript regex pattern                                                          | outer includes the slashes and any flags
-- doubleSquareBrackets |  iD, aD   | lua, sh, md | text enclosed by [[]]                                                             | outer includes the four square brackets
-- column               |  |        | all         | column down until indent or shorter line. Accepts {count} for multiple columns.   | -
-- restOfParagraph      |  r        | all         | like }, but linewise                                                              | -
-- subword              |  iS, aS   | all         | like iw, but treating -, _ or . as word delimiters and only part of camelcase.    | outer includes trailing _ or -
-- entireBuffer         |  gG       | all         | entire buffer as one text object                                                  | -
-- url                  |  L        | all         | link beginning with "http"                                                        | -
-- shellPipe            |  iP/aP    | *sh         | command stdout is piped to                                                        | outer includes the front pipe character

-- use 'vim-scripts/argtextobj.vim'          -- (a)       Argument -- Replaced by treesitter-text-objects
--
-- TODO
-- Consider:
--   https://github.com/wellle/targets.vim -- A collection of text object with look ahead/behind

return {
  {
    -- (c) Comments
    'glts/vim-textobj-comment',
    dependencies = 'kana/vim-textobj-user'
  },
  {
    -- (l) Line
    'kana/vim-textobj-line',
    dependencies = 'kana/vim-textobj-user'
  },
  {
    -- (e) Entire file
    'kana/vim-textobj-entire',
    dependencies = 'kana/vim-textobj-user'
  },
  {
    -- (i) Intent blocks
    'kana/vim-textobj-indent',
    dependencies = 'kana/vim-textobj-user'
    -- 'michaeljsmith/vim-indent-object'     -- (i)       Indent blocks
  }
}
