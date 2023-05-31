local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'tokyonight_moon'
config.font = wezterm.font('IosevkaTerm Nerd Font Mono', { weight = 'DemiBold' })
config.font_size = 24.0
config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
}
config.adjust_window_size_when_changing_font_size = false
config.enable_scroll_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.8
config.macos_window_background_blur = 30
config.win32_system_backdrop = 'Tabbed'
config.window_decorations = "RESIZE"
config.mouse_bindings = {
    {
        event = { Drag = { streak = 1, button = 'Left' } },
        mods = 'SUPER',
        action = wezterm.action.StartWindowDrag,
    },
    {
        event = { Drag = { streak = 1, button = 'Left' } },
        mods = 'CTRL|SHIFT',
        action = wezterm.action.StartWindowDrag,
    },
}

return config
