local global = require('theme.global')
local gears = require('gears')

local theme = os.getenv('AWESOMEWM_THEME') or 'ReyBB8'
if (theme ~= 'ReyBB8' and
    theme ~= 'yoda' and
    theme ~= 'astronaut') then
    theme = 'ReyBB8'
end
local theme_loc = string.format('theme.%s', theme)

return gears.table.join(global, require(theme_loc))
