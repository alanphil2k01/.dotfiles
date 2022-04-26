local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local dpi = require("beautiful.xresources").apply_dpi
local widgets_path = gears.filesystem.get_configuration_dir() .. 'widgets/init.lua'

return function(s)
    -- To reload the widgets every time theme is changed
    local w = dofile(widgets_path)
    if(s.top_panel) then
        s.top_panel:remove()
    end
    -- Create a promptbox for each screen
    s.promptbox = awful.widget.prompt()

    -- Create the wibox
    local panel = awful.wibar({ position = "top", screen = s, height = dpi(20)})

    -- Add widgets to the wibar
    panel:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            w.spr,
            w.taglist(s),
            s.promptbox,
            w.spr,
        },
        {-- Middle widget
            layout = wibox.layout.flex.horizontal,
            w.tasklist(s)
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            w.spr,
            w.cpu_icon,
            w.tinyspr,
            w.cpu_widget,
            w.tinyspr,
            w.ramarc_widget,
            w.tinyspr,
            w.volumearc_widget,
            w.tinyspr,
            w.batteryarc_widget,
            w.clock,
            wibox.widget.systray(),
            w.tinyspr,
            w.layoutbox(s),
            w.spr
        },
    }
    s.top_panel = panel
end
