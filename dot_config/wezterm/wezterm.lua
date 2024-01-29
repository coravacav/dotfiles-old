local wezterm = require 'wezterm'
local config = {}

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'wsl' }
    config.window_background_opacity = 0.9
    config.win32_system_backdrop = 'Tabbed'
elseif
    wezterm.target_triple == 'aarch64-apple-darwin' or
    wezterm.target_triple == 'x86_64-apple-darwin'
then
    -- config.window_background_opacity = 0.8
    -- config.macos_window_background_blur = 30
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
end
-- {
--     key = 'w',
--     mods = 'CMD',
--     action = wezterm.action.CloseCurrentTab { confirm = true },
-- },

-- config.background = {
--     {
--         source = {
--             Color = "#222222"
--         },
--         width = "100%",
--         height = "100%",
--         opacity = 0.97
--     },
--     {
--         source = {
--             Gradient = {
--                 colors = {
--                     "#641a80", "#8c2981", "#b63679", "#641a80", "#8c2981"
--                 },
--                 orientation = { Radial = { radius = 1 } },
--             }
--         },
--         width = "100%",
--         height = "100%",
--         opacity = 0.3
--     },
--     {
--         source = {
--             Gradient = {
--                 colors = { '#000000', '#000000' },
--                 orientation = { Radial = { radius = 3.5 } },
--             }
--         },
--         width = "100%",
--         height = "100%",
--         opacity = 0.05
--     },
-- }

config.color_scheme = 'tokyonight_moon'
config.font = wezterm.font('MonaspiceNe Nerd Font Mono', { weight = 'Regular' })
config.font_size = 16.0
config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
}
config.adjust_window_size_when_changing_font_size = false
config.enable_scroll_bar = true
config.hide_tab_bar_if_only_one_tab = true
-- config.window_decorations = "RESIZE"
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
config.window_close_confirmation = 'NeverPrompt'


return config
