-- Clock widget
local wibox = require('wibox')

return wibox.widget {
    format = " %a %d %b %R",
    refresh = 1,
    widget = wibox.widget.textclock,
}
