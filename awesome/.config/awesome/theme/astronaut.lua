local gears = require("gears")
local theme_path = gears.filesystem.get_configuration_dir() .. 'theme/'

local theme = gears.table.join({}, require('theme.global'))

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

theme.wallpaper = theme_path.."wallpapers/astronaut.jpg"

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

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
