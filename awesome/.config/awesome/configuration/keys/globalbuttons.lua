local awful = require('awful')
local gears = require('gears')

local mainmenu = require('configuration.mainmenu')

-- Mouse bindings
local globalbuttons = gears.table.join(
    awful.button({ }, 3, function () mainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
)

return globalbuttons
