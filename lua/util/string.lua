string.lpad = function(str, len, char)
  if char == nil then char = ' ' end
  return str .. string.rep(char, len - #str)
end

string.startswith = function(text, prefix)
    return text:find(prefix, 1, true) == 1
end

