local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local dpi = require("beautiful.xresources").apply_dpi


return function()
    return {
        taglist = require('widgets.taglist'),
        tasklist = require('widgets.tasklist'),
        layoutbox = require('widgets.layoutbox'),
        clock = require('widgets.clock'),
        -- Seperator
        spr = wibox.widget {
            forced_width = 20,
        },

        -- Tiny Seperator
        tinyspr = wibox.widget {
            forced_width = 8,
        },

        -- CPU Icon
        cpu_icon = wibox.widget {
            image = beautiful.cpu_icon,
            forced_width = dpi(15),
            widget = wibox.widget.imagebox
        },

        -- CPU Widget
        cpu_widget = require("widgets.cpu-widget")({
            width = 40,
            step_width = 2,
            step_spacing = 0,
            color = beautiful.fg_focus,
            enable_kill_button = true
        }),

        -- RAM Widget
        ramarc_widget = require("widgets.ramarc-widget")({
            main_color = beautiful.fg_focus,
            warning_color = '#ff0000',
            thickness = 2,
            height = 25,
            path_to_icon = beautiful.ram_icon
        }),

        -- Volume Widget
        volumearc_widget = require("widgets.volumearc")({
            main_color = beautiful.fg_focus,
            mute_color = '#ff0000',
            thickness = 2,
            height = 25,
            path_to_icon = beautiful.volume_icon
        }),

        -- Batter Widget
        batteryarc_widget = require("widgets.batteryarc")({
            show_current_level = true,
            arc_thickness = 2,
            size = 20,
            warning_msg_title  = "Huston, we have a problem",
            warning_msg_text = "Battery is dying",
            warning_msg_position = "top_right",
            enable_battery_full_charge_warning=false,
        }),
    }
end
