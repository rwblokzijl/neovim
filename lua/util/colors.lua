local colors = {
  Bg0        = "GruvboxBg0",
  Bg1        = "GruvboxBg1",
  Bg2        = "GruvboxBg2",
  Bg3        = "GruvboxBg3",
  Bg4        = "GruvboxBg4",
  Fg0        = "GruvboxFg0",
  Fg1        = "GruvboxFg1",
  Fg2        = "GruvboxFg2",
  Fg3        = "GruvboxFg3",
  Fg4        = "GruvboxFg4",
  Gray       = "GruvboxGray",

  Aqua       = "GruvboxAqua",
  AquaBold   = "GruvboxAquaBold",
  AquaSign   = "GruvboxAquaSign",
  Blue       = "GruvboxBlue",
  BlueBold   = "GruvboxBlueBold",
  BlueSign   = "GruvboxBlueSign",
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
  Red = "#d75f5f",
}

local color_prefix = "Gruvbox"
for color_infix, color_value in pairs(custom_colors) do
  for _, color_suffix in ipairs({"", "Bold", "Sign"}) do
    local color_name = color_prefix..color_infix..color_suffix
    local color = vim.api.nvim_get_hl_by_name(color_name, true)
    color.foreground = color_value
    vim.api.nvim_set_hl(0, color_name, color)
  end
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

local get_transision_colors = function(from, to)
  local from_color =  vim.api.nvim_get_hl_by_name(
    from,
    true
  )
  local to_color =  vim.api.nvim_get_hl_by_name(
    to,
    true
  )
  return {fg=from_color.background, bg=to_color.background}

end

local get_combined_colors = function(fg, bg)
  local fg_color =  vim.api.nvim_get_hl_by_name(
    fg,
    true
  )
  local bg_color =  vim.api.nvim_get_hl_by_name(
    bg,
    true
  )
  return {fg=fg_color.foreground, bg=bg_color.background}

end

local get_color_components = function(color)
  local ans =  vim.api.nvim_get_hl_by_name(
    color,
    true
  )
  return {
    fg = ans.foreground,
    bg = ans.background,
    bold = ans.bold,
  }
end

return {
  colors = colors,
  getColor = get_color,
  getColorComponents = get_color_components,
  getTransisionColors = get_transision_colors,
  getCombinedColors = get_combined_colors,
}
