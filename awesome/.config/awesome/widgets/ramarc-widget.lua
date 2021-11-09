-- RAM Widget
local awful = require("awful")
local beautiful = require("beautiful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")

local GET_RAM_CMD = 'bash -c "LANGUAGE=en_US.UTF-8 free | grep -z Mem.*Swap.*"'
local widget = {}

local function worker(args)

    local args = args or {}

    local main_color = args.main_color or beautiful.fg_color
    local warning_color = args.warning_color or beautiful.fg_urgent
    local bg_color = args.bg_color or '#ffffff11'
    local path_to_icon = args.path_to_icon or nil
    local thickness = args.thickness or 2
    local height = args.height or 18
    local timeout = args.timeout or 5

    local get_ram_cmd = args.get_volume_cmd or GET_RAM_CMD

    local icon = {
        id = "icon",
        image = path_to_icon,
        resize = true,
        widget = wibox.widget.imagebox,
    }

    local ramarc = wibox.widget {
        icon,
        colors = { "#ffffff" },
        min_value = 0,
        max_value = 1,
        thickness = thickness,
        start_angle = 4.71238898, -- 2pi*3/4
        forced_height = height,
        forced_width = height,
        bg = bg_color,
        paddings = 3,
        widget = wibox.container.arcchart
    }

    local w = wibox {
        height = 200,
        width = 400,
        ontop = true,
        expand = true,
        bg = '#1e252c',
        max_widget_size = 500
    }

    w:setup {
        border_width = 0,
        colors = {
            '#009688',
            '#12F4B4',
            '#00695C',
        },
        display_labels = false,
        forced_width = 25,
        id = 'pie',
        widget = wibox.widget.piechart
    }

    local total, used, free, shared, buff_cache, available, total_swap, used_swap, free_swap

    local function getPercentage(value)
        return math.floor(value / (total+total_swap) * 100 + 0.5) .. '%'
    end

    local update_graphic  = function(widget, stdout, _, _, _)
            total, used, free, _, buff_cache, _, total_swap, used_swap, free_swap =
                stdout:match('(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*(%d+)%s*Swap:%s*(%d+)%s*(%d+)%s*(%d+)')
            local used_percent = used/total
            if used_percent > 0.90 then
                widget.colors = { warning_color }
            else
                widget.colors = { main_color }
            end
            widget.value = used_percent
            if w.visible then
                w.pie.data_list = {
                    {'used ' .. getPercentage(used + used_swap), used + used_swap},
                    {'free ' .. getPercentage(free + free_swap), free + free_swap},
                    {'buff_cache ' .. getPercentage(buff_cache), buff_cache}
                }
            end
        end

    function ToggleRAMPopUp()
                awful.placement.top_right(w, { margins = {top = 25, right = 10}, parent = awful.screen.focused() })
                w.pie.data_list = {
                    {'used ' .. getPercentage(used + used_swap), used + used_swap},
                    {'free ' .. getPercentage(free + free_swap), free + free_swap},
                    {'buff_cache ' .. getPercentage(buff_cache), buff_cache}
                }
                w.pie.display_labels = true
                w.visible = not w.visible
    end
    ramarc:buttons(
        awful.util.table.join(
            awful.button({}, 1, ToggleRAMPopUp)
        )
    )

    watch(get_ram_cmd, timeout, update_graphic, ramarc)
    return ramarc
end

return setmetatable(widget, { __call = function(_, ...) return worker(...) end })
