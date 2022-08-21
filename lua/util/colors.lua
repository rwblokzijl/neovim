local colors = {
  Aqua       = "GruvboxAqua",
  AquaBold   = "GruvboxAquaBold",
  AquaSign   = "GruvboxAquaSign",
  Bg0        = "GruvboxBg0",
  Bg1        = "GruvboxBg1",
  Bg2        = "GruvboxBg2",
  Bg3        = "GruvboxBg3",
  Bg4        = "GruvboxBg4",
  Blue       = "GruvboxBlue",
  BlueBold   = "GruvboxBlueBold",
  BlueSign   = "GruvboxBlueSign",
  Fg0        = "GruvboxFg0",
  Fg1        = "GruvboxFg1",
  Fg2        = "GruvboxFg2",
  Fg3        = "GruvboxFg3",
  Fg4        = "GruvboxFg4",
  Gray       = "GruvboxGray",
  Green      = "GruvboxGreen",
  GreenBold  = "GruvboxGreenBold",
  GreenSign  = "GruvboxGreenSign",
  Orange     = "GruvboxOrange",
  OrangeBold = "GruvboxOrangeBold",
  OrangeSign = "GruvboxOrangeSign",
  Purple     = "GruvboxPurple",
  PurpleBold = "GruvboxPurpleBold",
  PurpleSign = "GruvboxPurpleSign",
  Red        = "GruvboxRed",
  RedBold    = "GruvboxRedBold",
  RedSign    = "GruvboxRedSign",
  Yellow     = "GruvboxYellow",
  YellowBold = "GruvboxYellowBold",
  YellowSign = "GruvboxYellowSign",
  White      = "GruvboxFg1",
  WhiteBold  = "GruvboxFg1",
}

local custom_colors = {
  GruvboxRed     = "#d75f5f",
  -- GruvboxRedBold = "#CC5555",
  -- GruvboxRedSign = "#CC5555",
}

for color_name, color_value in pairs(custom_colors) do
  local color = vim.api.nvim_get_hl_by_name(color_name, true)
  color.foreground = color_value
  vim.api.nvim_set_hl(0, color_name, color)
end

local rev = {}
for name, group in pairs(colors) do
  local color = vim.api.nvim_get_hl_by_name(group, true)
  local tmp = color.foreground
  color.foreground = color.background
  color.background = tmp
  vim.api.nvim_set_hl(0, group .. "Rev", color)
  rev[name.."Rev"] = group .. "Rev"
end
for k,v in pairs(rev) do colors[k] = v end

local get_color = function(color, opts)
  local color_name = color .. (opts.bold and "Bold" or "") .. (opts.rev and "Rev" or "")
  return colors[color_name] or error("Color " .. color_name .. " not found.")
end

local get_color_components = function(color, opts)
  return vim.api.nvim_get_hl_by_name(
    get_color(color, opts),
    true
  )
end


return {
  colors = colors,
  getColor = get_color,
  getColorComponents = get_color_components,
}
