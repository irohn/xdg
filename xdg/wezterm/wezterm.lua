local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

local platform = wezterm.target_triple
if platform == "x86_64-pc-windows-msvc" then
  config.default_prog = { "wsl", "~" }
end

if (platform == "x86_64-apple-darwin") or (platform == "aarch64-apple-darwin") then
  config.keys = {
    { mods = "OPT", key = "LeftArrow", action = act.SendKey({ mods = "ALT", key = "b" }) },
    { mods = "OPT", key = "RightArrow", action = act.SendKey({ mods = "ALT", key = "f" }) },
    { mods = "CMD", key = "LeftArrow", action = act.SendKey({ mods = "CTRL", key = "a" }) },
    { mods = "CMD", key = "RightArrow", action = act.SendKey({ mods = "CTRL", key = "e" }) },
    { mods = "CMD", key = "Backspace", action = act.SendKey({ mods = "CTRL", key = "u" }) },
  }
end

config.window_decorations = "RESIZE"
config.window_padding = { left = 1, right = 1, top = 0, bottom = 0 }
config.window_background_opacity = 1.0
config.macos_window_background_blur = 20

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

config.color_scheme = "kanagawabones"

config.font_size = 20.0
config.audible_bell = "Disabled"

config.max_fps = 120

return config

