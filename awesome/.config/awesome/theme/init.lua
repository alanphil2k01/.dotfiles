local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local global = require('theme.global')

local theme

local theme_menu = awful.menu({ items = {
    { "ReyBB8", myawesomemenu, beautiful.awesome_icon },
                            }
})

function ApplyTheme(t)
    if (t) then
        theme = t
    else
        theme = os.getenv('AWESOMEWM_THEME') or 'ReyBB8'
    end

    if (theme ~= 'ReyBB8' and
        theme ~= 'Yoda' and
        theme ~= 'Astronaut') then
            theme = 'ReyBB8'
    end


    local theme_loc = string.format('theme.%s', theme)
    beautiful.init(gears.table.join(global, require(theme_loc)))

    local top_panel = require('layout.top-panel')

    require('module.notifications')
    require('module.decorate-client')
    require('configuration.mainmenu')()

    -- Re-set wallpaper when screen changes resolution
    _G.screen.connect_signal( "property::geometry", function(s)
            gears.wallpaper.maximized(beautiful.wallpaper, s, true)
        end)

    awful.screen.connect_for_each_screen(
        function(s)
            gears.wallpaper.maximized(beautiful.wallpaper, s, true)
            top_panel(s)
        end)

    -- Make the focused window have a glowing border
    _G.client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
    _G.client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)
end
