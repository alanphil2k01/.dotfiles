-- Standar libraries
local awful = require("awful")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Initialize theme
require('theme')
ApplyTheme()

-- Autostart apps
require('module.auto-start')

-- Configurations
require('configuration.client')
require('configuration.tags')

-- Set global keys and buttons
_G.root.keys(require('configuration.keys.globalkeys'))
_G.root.buttons(require('configuration.keys.globalbuttons'))


-- Signal function to execute when a new client appears.
_G.client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not _G.awesome.startup then
      awful.client.setslave(c)
    end
    if _G.awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
_G.client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
