-- Lualine theme for codeSTACKr

local colors = {
  bg = "#070f15",
  bg_alt = "#0c1a25",
  fg = "#ffffff",
  fg_muted = "#c8d6e5",
  fg_dim = "#506375",
  orange = "#ff652f",
  yellow = "#ffe400",
  green = "#14a76c",
  blue = "#5eb7ee",
  pink = "#ff5177",
  dark = "#09131b",
}

return {
  normal = {
    a = { fg = colors.fg, bg = colors.orange, gui = "bold" },
    b = { fg = colors.fg_muted, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg },
    x = { fg = colors.fg_muted, bg = colors.bg },
    y = { fg = colors.fg_muted, bg = colors.bg_alt },
    z = { fg = colors.fg, bg = colors.orange, gui = "bold" },
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
    a = { fg = colors.fg, bg = colors.pink, gui = "bold" },
    b = { fg = colors.fg_muted, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.fg, bg = colors.pink, gui = "bold" },
  },
  command = {
    a = { fg = colors.dark, bg = colors.blue, gui = "bold" },
    b = { fg = colors.fg_muted, bg = colors.bg_alt },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.dark, bg = colors.blue, gui = "bold" },
  },
  inactive = {
    a = { fg = colors.fg_dim, bg = colors.bg_alt },
    b = { fg = colors.fg_dim, bg = colors.bg_alt },
    c = { fg = colors.fg_dim, bg = colors.bg },
    z = { fg = colors.fg_dim, bg = colors.bg_alt },
  },
}
