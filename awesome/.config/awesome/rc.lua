-- Standar libraries
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Initialize theme
beautiful.init(require('theme').ReyBB8)

-- Layout
require('layout')

-- Modules
require('module.notifications')
require('module.auto-start')
require('module.decorate-client')

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
    -- if not awesome.startup then awful.client.setslave(c) end
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

-- Make the focused window have a glowing border
_G.client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
_G.client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)
