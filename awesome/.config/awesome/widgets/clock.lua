-- Clock widget
local wibox = require('wibox')
local beautiful = require('beautiful')

return wibox.widget {
    colors = beautiful.fg_focus,
    format = " %a %d %b %R",
    refresh = 60,
    widget = wibox.widget.textclock,
}
