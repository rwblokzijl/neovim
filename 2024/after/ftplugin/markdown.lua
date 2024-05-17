function MarkdownFoldLevel(lnum)
  local line = vim.fn.getline(lnum) -- Get the line content
  local prev_line = vim.fn.getline(lnum - 1)
  if prev_line == nil then
    return
  end
  local header_match = line:match("^#+") -- Match consecutive # at the start
  local prev_header_match = prev_line:match("^#+")

  if header_match then
    return ">" .. string.len(header_match) -- Use the number of # for the fold level
  elseif prev_header_match then
    return string.len(prev_header_match)   -- Same level as previous line if it was a header
  else
    return "="                             -- No folding if not a header or directly after a header
  end
end

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.MarkdownFoldLevel(v:lnum)"
vim.wo.foldenable = true
