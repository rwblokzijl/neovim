string.lpad = function(str, len, char)
  if char == nil then char = ' ' end
  return str .. string.rep(char, len - #str)
end

string.startswith = function(text, prefix)
  return text:find(prefix, 1, true) == 1
end

string.basename = function(str)
  local name = string.gsub(str, "(.*/)(.*)", "%2")
  return name
end

string.path_parent = function(file_path)
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

