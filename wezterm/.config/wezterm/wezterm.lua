local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

-- Open maximized by default
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_win = window:gui_window()
  if gui_win then
    gui_win:maximize()
  end
end)

-- Use config_builder for better error reporting and forward compatibility
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

--------------------------------------------------------------------------------
-- 1. COLOR SCHEME & THEME
--------------------------------------------------------------------------------
config.color_schemes = {
  ["codeSTACKr"] = {
    foreground = "#ffffff",
    background = "#09131b",
    cursor_bg = "#ffe400",
    cursor_fg = "#09131b",
    cursor_border = "#ffe400",
    selection_fg = "#ffffff",
    selection_bg = "#163852",
    scrollbar_thumb = "#1b3951",
    split = "#1b3951",
    ansi = {
      "#09131b",
      "#ff5177",
      "#14a76c",
      "#ffe400",
      "#5eb7ee",
      "#746aff",
      "#1efaa2",
      "#ffffff",
    },
    brights = {
      "#506375",
      "#ff652f",
      "#14a76c",
      "#ffe400",
      "#5eb7ee",
      "#746aff",
      "#1efaa2",
      "#ffffff",
    },
  },
  ["Vivid Black"] = {
    foreground = "#eeeeee",
    background = "#141417",
    cursor_bg = "#ffb638",
    cursor_fg = "#141417",
    cursor_border = "#ffb638",
    selection_fg = "#eeeeee",
    selection_bg = "#2b2b36",
    scrollbar_thumb = "#2a2a32",
    split = "#2a2a32",
    ansi = {
      "#141417",
      "#d62c2c",
      "#37ae6f",
      "#ffb638",
      "#28a9ff",
      "#e66dff",
      "#14e5d4",
      "#eeeeee",
    },
    brights = {
      "#555555",
      "#d62c2c",
      "#42dd76",
      "#ffb638",
      "#28a9ff",
      "#e66dff",
      "#14e5d4",
      "#ffffff",
    },
  },
}

-- Active theme: 'codeSTACKr' or 'Vivid Black'
config.color_scheme = "codeSTACKr"

--------------------------------------------------------------------------------
-- 2. TYPOGRAPHY & FONTS (VSCode-like typography: JetBrains Mono, bold & clear)
--------------------------------------------------------------------------------
config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMono Nerd Font", weight = "Bold" },
  { family = "FiraCode Nerd Font", weight = "Bold" },
  "Noto Color Emoji",
})
config.font_size = 14
config.line_height = 1.10
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

config.font_rules = {
  {
    intensity = "Bold",
    italic = false,
    font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
  },
  {
    intensity = "Half",
    italic = false,
    font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
  },
  {
    intensity = "Normal",
    italic = true,
    font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold", italic = true }),
  },
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold", italic = true }),
  },
}

--------------------------------------------------------------------------------
-- 3. WINDOW & APPEARANCE
--------------------------------------------------------------------------------
-- Slight transparency for a sleek blurred background
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

-- Padding around the terminal content
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Modern frameless window look (keeps window resizable)
config.window_decorations = "RESIZE"

-- Smooth blinking bar cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"

-- Hide scrollbar for a cleaner canvas
config.enable_scroll_bar = false

--------------------------------------------------------------------------------
-- 4. TAB BAR
--------------------------------------------------------------------------------
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 28

-- Beautiful custom status format on the right side of the tab bar
wezterm.on("update-right-status", function(window, pane)
  local leader = ""
  if window:leader_is_active() then
    leader = " 🌊 LEADER "
  end

  window:set_right_status(wezterm.format({
    { Foreground = { Color = "#ff9e64" } },
    { Text = leader },
    { Foreground = { Color = "#7aa2f7" } },
    { Text = wezterm.strftime(" %H:%M ") },
  }))
end)

--------------------------------------------------------------------------------
-- 5. MULTIPLEXER & KEYBINDINGS
--------------------------------------------------------------------------------
-- Leader key: Ctrl+Space (press twice to send literal Ctrl+Space)
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
  -- Pass Ctrl+Space to inner applications when pressed twice
  { key = "Space", mods = "LEADER|CTRL", action = act.SendKey({ key = "Space", mods = "CTRL" }) },

  -- Pass Ctrl+Tab and Ctrl+Shift+Tab to Neovim for buffer switching
  { key = "Tab", mods = "CTRL", action = act.DisableDefaultAssignment },
  { key = "Tab", mods = "CTRL|SHIFT", action = act.DisableDefaultAssignment },

  -- Pane splitting (similar to tmux)
  { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

  -- Vim-style pane navigation
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

  -- Pane management
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

  -- Tabs
  { key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "w", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
  { key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },

  -- Quick Switch Tabs with Alt + 1..9
  { key = "1", mods = "ALT", action = act.ActivateTab(0) },
  { key = "2", mods = "ALT", action = act.ActivateTab(1) },
  { key = "3", mods = "ALT", action = act.ActivateTab(2) },
  { key = "4", mods = "ALT", action = act.ActivateTab(3) },
  { key = "5", mods = "ALT", action = act.ActivateTab(4) },

  -- Font size adjustments
  { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
  { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
  { key = "0", mods = "CTRL", action = act.ResetFontSize },

  -- Command Palette
  { key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
}

--------------------------------------------------------------------------------
-- 6. SYSTEM & PERFORMANCE
--------------------------------------------------------------------------------
config.enable_wayland = true
config.scrollback_lines = 15000
config.check_for_updates = false

return config
