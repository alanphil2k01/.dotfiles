-- Mainmenu configuration

local awful = require('awful')
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Defautlt apps
local apps = require('configuration.apps')
local terminal = apps.default.terminal
local browser = apps.default.browser1
local files = apps.default.files
local discord = "discord"
local ferdi = "ferdi"
local telegram = "telegram-desktop"
local volume = "pavucontrol"
local bluetooth = "blueberry"
local arandr = "arandr"
local lutris = "lutris"
local screenshot = apps.default.region_screenshot
local editor_cmd = terminal .. " -e " ..apps.default.editor


local myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", editor_cmd .. " " .. _G.awesome.conffile },
    { "restart", _G.awesome.restart },
    { "quit", function() _G.awesome.quit() end },
}

local quick_launch = {
    { "browser", browser },
    { "file explorer", files },
    { "discord", discord },
    { "ferdi", ferdi },
    { "telegram", telegram },
    { "lutris", lutris },
}

local utilities = {
    { "arandr", arandr },
    { "bluetooth", bluetooth },
    { "volume", volume },
    { "screenshot", screenshot },
}

local mainmenu

return function()
    function ShowMainMenu()
        mainmenu:toggle()
    end
    mainmenu = awful.menu({ items = {
            { "awesome", myawesomemenu, beautiful.awesome_icon },
            { "open terminal", terminal, beautiful.terminal_icon },
            { "quick launch", quick_launch, beautiful.launch_icon },
            { "utilities", utilities, beautiful.utilities_icon },
        }
    })
end
