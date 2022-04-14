local awful = require('awful')
local gears = require('gears')

-- Mouse bindings
local globalbuttons = gears.table.join(
    awful.button({ }, 3, function () ShowMainMenu() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
)

return globalbuttons
