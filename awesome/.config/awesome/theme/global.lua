local dpi = require("beautiful.xresources").apply_dpi
local gfs = require("gears.filesystem")
local theme_path = gfs.get_configuration_dir() .. 'theme/'

local theme = {}

theme.font          = "Fira Code Nerd Font 14"

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(1)

theme.menu_submenu_icon = theme_path.."icons/submenu.png"
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

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
