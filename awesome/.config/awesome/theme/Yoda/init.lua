local theme_assets = require("beautiful.theme_assets")
local gears = require("gears")
local theme_path = gears.filesystem.get_configuration_dir() .. 'theme/Yoda/'

local theme = {}

theme.bg_normal     = "#0F161C"
theme.bg_focus      = "#0F161C"
theme.bg_urgent     = "#ff0000"

theme.fg_normal     = "#26A69A"
theme.fg_focus      = "#12F4B4"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#11161C"

theme.border_normal = "#273341"
theme.border_focus  = theme.fg_focus
theme.border_marked = "#91231c"

theme.wallpaper = theme_path.."wallpaper.jpg"

theme.bg_systray    = theme.bg_normal

theme.taglist_bg_urgent = theme.bg_normal
theme.taglist_fg_urgent = "#EF5350"
theme.taglist_bg_empty = theme.bg_normal
theme.taglist_fg_empty = "#004D40"
theme.taglist_bg_focus =  theme.bg_focus
theme.taglist_fg_focus =  "#B2DFDB"
theme.taglist_fg_occupied = "#00897B"

theme.tasklist_fg_minimize = theme.fg_focus
theme.tasklist_bg_minimize   = theme.bg_normal

theme.hotkeys_fg = theme.fg_focus
theme.hotkeys_label_fg = theme.bg_focus
theme.hotkeys_modifiers_fg = theme.fg_urgent

local icon_path = theme_path .. "icons/"

theme.volume_icon = icon_path .. "volume.svg"
theme.cpu_icon = icon_path .. "cpu.svg"
theme.ram_icon = icon_path .. "ram.svg"

theme.terminal_icon = icon_path .. "terminal.svg"
theme.launch_icon = icon_path .. "rocket.svg"
theme.utilities_icon = icon_path .. "gear.svg"

-- Generate Awesome icon:
local dpi = require("beautiful.xresources").apply_dpi
theme.menu_height = dpi(20)
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
