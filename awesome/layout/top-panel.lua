local awful = require('awful')
local wibox = require('wibox')
local clock = require('widgets.clock')
local beautiful = require('beautiful')
local dpi = require("beautiful.xresources").apply_dpi

local taglist = require('widgets.taglist')
local tasklist = require('widgets.tasklist')
local layoutbox = require('widgets.layoutbox')

-- Seperator
local spr = wibox.widget {
    forced_width = 20,
}

-- Tiny Seperator
local tinyspr = wibox.widget {
    forced_width = 8,
}

-- CPU Icon
local cpu_icon = wibox.widget {
    image = beautiful.cpu_icon,
    forced_width = dpi(15),
    widget = wibox.widget.imagebox
}

-- CPU Widget
local cpu_widget = require("widgets.cpu-widget")({
    width = 70,
    step_width = 2,
    step_spacing = 0,
    color = beautiful.fg_focus,
    enable_kill_button = true
})

-- RAM Widget
local ramarc_widget = require("widgets.ramarc-widget")({
    main_color = beautiful.fg_focus,
    warning_color = '#ff0000',
    thickness = 2,
    height = 25,
    timeout = 0.1,
    path_to_icon = beautiful.ram_icon
})

-- Volume Widget
local volumearc_widget = require("widgets.volumearc")({
    main_color = beautiful.fg_focus,
    mute_color = '#ff0000',
    thickness = 2,
    height = 25,
    timeout = 0.1,
    path_to_icon = beautiful.volume_icon
})

-- Batter Widget
local batteryarc_widget = require("widgets.batteryarc")({
    show_current_level = true,
    arc_thickness = 2,
    size = 20,
    warning_msg_title  = "Huston, we have a problem",
    warning_msg_text = "Battery is dying",
    warning_msg_position = "top_right",
})

return function(s)

    -- Create a promptbox for each screen
    s.promptbox = awful.widget.prompt()

    -- Create the wibox
    local panel = awful.wibar({ position = "top", screen = s, height = dpi(20)})

    -- Add widgets to the wibar
    panel:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            spr,
            taglist(s),
            s.promptbox,
            spr,
        },
        {-- Middle widget
            layout = wibox.layout.flex.horizontal,
            tasklist(s)
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spr,
            cpu_icon,
            tinyspr,
            cpu_widget,
            tinyspr,
            ramarc_widget,
            tinyspr,
            volumearc_widget,
            tinyspr,
            batteryarc_widget,
            clock,
            wibox.widget.systray(),
            tinyspr,
            layoutbox(s),
            spr
        },
    }
    return panel
end
