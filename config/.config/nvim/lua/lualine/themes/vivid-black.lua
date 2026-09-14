-- Lualine theme for Vivid Black

local colors = {
  bg = "#101012",
  bg_alt = "#1f1f24",
  fg = "#eeeeee",
  fg_muted = "#cbcbcb",
  fg_dim = "#555555",
  blue = "#28a9ff",
  green = "#37ae6f",
  yellow = "#ffb638",
  purple = "#a95eff",
  red = "#d62c2c",
  dark = "#101012",
}

return {
  normal = {
    a = { fg = colors.dark, bg = colors.blue, gui = "bold" },
    b = { fg = colors.fg_muted, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg },
    x = { fg = colors.fg_muted, bg = colors.bg },
    y = { fg = colors.fg_muted, bg = colors.bg_alt },
    z = { fg = colors.dark, bg = colors.blue, gui = "bold" },
  },
  insert = {
    a = { fg = colors.dark, bg = colors.green, gui = "bold" },
    b = { fg = colors.fg_muted, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.dark, bg = colors.green, gui = "bold" },
  },
  visual = {
    a = { fg = colors.dark, bg = colors.yellow, gui = "bold" },
    b = { fg = colors.fg_muted, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.dark, bg = colors.yellow, gui = "bold" },
  },
  replace = {
    a = { fg = "#ffffff", bg = colors.red, gui = "bold" },
    b = { fg = colors.fg_muted, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = "#ffffff", bg = colors.red, gui = "bold" },
  },
  command = {
    a = { fg = colors.dark, bg = colors.purple, gui = "bold" },
    b = { fg = colors.fg_muted, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.dark, bg = colors.purple, gui = "bold" },
  },
  inactive = {
    a = { fg = colors.fg_dim, bg = colors.bg_alt },
    b = { fg = colors.fg_dim, bg = colors.bg_alt },
    c = { fg = colors.fg_dim, bg = colors.bg },
    z = { fg = colors.fg_dim, bg = colors.bg_alt },
  },
}
