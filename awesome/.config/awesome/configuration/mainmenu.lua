-- Mainmenu configuration

local awful = require('awful')
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Defautlt terminal and editor
local apps = require('configuration.apps')
local terminal = apps.default.terminal
local editor_cmd = terminal .. " -e " ..apps.default.editor

local myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. _G.awesome.conffile },
   { "restart", _G.awesome.restart },
   { "quit", function() _G.awesome.quit() end },
}

local mainmenu

function ShowMainMenu()
    mainmenu:toggle()
end

return function()
    mainmenu = awful.menu({ items = {
            { "awesome", myawesomemenu, beautiful.awesome_icon },
            { "open terminal", terminal }
        }
    })
end
