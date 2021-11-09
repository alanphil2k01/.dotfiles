local theme_assets = require("beautiful.theme_assets")
local dpi = require("beautiful.xresources").apply_dpi

local gfs = require("gears.filesystem")
local theme_path = gfs.get_configuration_dir() .. 'theme/'

local theme = {}

theme.font          = "FiraCode Regular 15"

theme.bg_normal     = "#0F161C"
theme.bg_focus      = "#0F161C"
theme.bg_urgent     = "#ff0000"

theme.fg_normal     = "#26A69A"
theme.fg_focus      = "#12F4B4"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#11161C"

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(1)
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
theme.tasklist_disable_icon = true
theme.tasklist_plain_task_name = true

theme.hotkeys_fg = theme.fg_focus
theme.hotkeys_label_fg = theme.bg_focus
theme.hotkeys_modifiers_fg = theme.fg_urgent

theme.menu_submenu_icon = theme_path.."icons/submenu.png"
theme.menu_height = dpi(20)
theme.menu_width  = dpi(200)

theme.titlebar_close_button_normal = theme_path.."icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = theme_path.."icons/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = theme_path.."icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = theme_path.."icons/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = theme_path.."icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = theme_path.."icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme_path.."icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = theme_path.."icons/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme_path.."icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = theme_path.."icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme_path.."icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = theme_path.."icons/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme_path.."icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = theme_path.."icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme_path.."icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = theme_path.."icons/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme_path.."icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme_path.."icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme_path.."icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = theme_path.."icons/titlebar/maximized_focus_active.png"

theme.layout_fairh = theme_path.."icons/layouts/fairhw.png"
theme.layout_fairv = theme_path.."icons/layouts/fairvw.png"
theme.layout_floating  = theme_path.."icons/layouts/floatingw.png"
theme.layout_magnifier = theme_path.."icons/layouts/magnifierw.png"
theme.layout_max = theme_path.."icons/layouts/maxw.png"
theme.layout_fullscreen = theme_path.."icons/layouts/fullscreenw.png"
theme.layout_tilebottom = theme_path.."icons/layouts/tilebottomw.png"
theme.layout_tileleft   = theme_path.."icons/layouts/tileleftw.png"
theme.layout_tile = theme_path.."icons/layouts/tilew.png"
theme.layout_tiletop = theme_path.."icons/layouts/tiletopw.png"
theme.layout_spiral  = theme_path.."icons/layouts/spiralw.png"
theme.layout_dwindle = theme_path.."icons/layouts/dwindlew.png"
theme.layout_cornernw = theme_path.."icons/layouts/cornernww.png"
theme.layout_cornerne = theme_path.."icons/layouts/cornernew.png"
theme.layout_cornersw = theme_path.."icons/layouts/cornersww.png"
theme.layout_cornerse = theme_path.."icons/layouts/cornersew.png"

theme.volume_icon = theme_path .. "icons/volume-up-solid_cyan.svg"
theme.cpu_icon = theme_path .. "icons/microchip-solid_cyan.svg"
theme.ram_icon = theme_path .. "icons/memory-solid_cyan.svg"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
