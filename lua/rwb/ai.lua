local secret_key_file = os.getenv( "HOME" ) .. "/.ssh/openai"

--[[
  Check if a file exists
  @param {string} file - The file to check
  @return {boolean} - True if the file exists, false otherwise
]]
local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end


--[[
  Reads all lines from a file and returns them as a table.
  @param {string} file - The file to read from.
  @return {table} - The lines from the file.
]]
local function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

-- if file_exists(secret_key_file) then
require('neural').setup({
  open_ai = {
    api_key = lines_from(secret_key_file)[1]
  }
})
-- end
