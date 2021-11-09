local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local top_panel = require('layout.top-panel')

-- Re-set wallpaper when screen changes resolution
_G.screen.connect_signal( "property::geometry", function(s) gears.wallpaper.maximized(beautiful.wallpaper, s, true) end)

awful.screen.connect_for_each_screen(
    function(s)
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
        s.top_panel = top_panel(s)
    end
)

function REAPPLYTHEME()
    awful.screen.connect_for_each_screen(
    function(s)
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
    )
end
