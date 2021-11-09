local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local hotkeys_popup = require("awful.hotkeys_popup")

local apps = require('configuration.apps')
local mainmenu = require('configuration.mainmenu')
local modkey = require('configuration.keys.mods').modkey
local altkey = require('configuration.keys.mods').altkey

-- Keybindings
local globalkeys = gears.table.join(
    awful.key(
        { modkey }, "i",
        function()
            beautiful.init(require('theme').ReyBB8)
            _G.REAPPLYTHEME()
        end,
        {description="theme colors change", group="awesome"}
    ),
    -- Show help
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

    -- Change tags
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    -- Change focused client
    awful.key({ modkey }, "j", function()
            awful.client.focus.global_bydirection("down")
            if _G.client.focus then _G.client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey }, "k", function()
            awful.client.focus.global_bydirection("up")
            if _G.client.focus then _G.client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
    awful.key({ modkey }, "h", function()
            awful.client.focus.global_bydirection("left")
            if _G.client.focus then _G.client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey }, "l", function()
            awful.client.focus.global_bydirection("right")
            if _G.client.focus then _G.client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),

    -- Show mainmenu
    awful.key({ modkey,           }, "w", function () mainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    awful.key({ altkey,           }, "Tab",
        function ()
            awful.client.focus.byidx(1)
            if _G.client.focus then
                _G.client.focus:raise()
            end
        end,
        {description = "cycle clients in screen", group = "client"}),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.byidx(1)
            if _G.client.focus then
                _G.client.focus:raise()
            end
        end,
        {description = "cycle clients in screen", group = "client"}),

    -- Client manipulation
    awful.key({ altkey,  "Shift"  }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ altkey,  "Shift"  }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "t", function () awful.spawn(apps.default.terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", _G.awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", _G.awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    -- Take a screenshot
    awful.key({ }, "Print", function() awful.spawn(apps.default.region_screenshot) end,
              {description = "take a screenshot", group = "hotkeys"}),
    awful.key({ modkey, }, "Print", function() awful.spawn(apps.default.screenshot) end,
              {description = "take a screenshot of the whole screen", group = "hotkeys"}),

    -- X screen locker
    awful.key({  }, "XF86PowerOff", function () awful.spawn.with_shell(apps.default.sleep_with_lock)  end, --NOTE set HandlePowerKey=ignore in /etc/systemd/logind.conf
              {description = "lock screen", group = "hotkeys"}),
    awful.key({ modkey, "Shift" }, "e", function () awful.spawn(apps.default.lock) end,
              {description = "lock screen", group = "hotkeys"}),

    -- Toggle top panel
    awful.key({ altkey }, "b", function ()
           for s in _G.screen do
              s.top_panel.visible = not s.top_panel.visible
           end
       end,
       {description = "toggle wibox", group = "awesome"}),

    -- Brightness
    awful.key({ }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 10") end,
              {description = "+10%", group = "hotkeys"}),
    awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 10") end,
              {description = "-10%", group = "hotkeys"}),

    -- ALSA volume control
    awful.key({  }, "XF86AudioRaiseVolume", function () awful.spawn('amixer -D pulse sset Master 1%+') end,
        {description = "volume up", group = "hotkeys"}),
    awful.key({  }, "XF86AudioLowerVolume", function () awful.spawn('amixer -D pulse sset Master 1%-') end,
        {description = "volume down", group = "hotkeys"}),
    awful.key({  }, "XF86AudioMute", function () awful.spawn('amixer -D pulse set Master 1+ toggle') end,
        {description = "toggle mute", group = "hotkeys"}),
    awful.key({ altkey, "Control" }, "m", function () awful.spawn('amixer -D pulse set Master 1+ toggle') end,
        {description = "volume 100%", group = "hotkeys"}),

    -- User Programs
    awful.key({ modkey }, "b", function () awful.spawn(apps.default.browser1) end,
              {description = "open browser", group = "launcher"}),
    awful.key({ modkey }, "c", function () awful.spawn(apps.default.browser2) end,
              {description = "open chromium", group = "launcher"}),
    awful.key({ modkey }, "e", function () awful.spawn(apps.default.files) end,
              {description = "open file explorer", group = "launcher"}),
    awful.key({ modkey }, "r", function () awful.spawn(apps.default.rss) end,
              {description = "open newsboat", group = "launcher"}),
    awful.key({  modkey }, "d", function () awful.spawn("dmenu_run") end,
    		{description = "run prompt", group = "launcher"}),
    awful.key({  modkey }, "v", function () awful.spawn("pavucontrol --tab=3") end,
    		{description = "open pavucontrol", group = "launcher"}),

    -- Prompt
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().promptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),

    -- Top panel widgets
    awful.key({ modkey, "Shift" }, "b", _G.show_battery_status,
                {description = "show battery status notification", group = "widgets"}),
    awful.key({ modkey, "Shift" }, "r", _G.ToggleRAMPopUp,
                {description = "toggle ram widget popup", group = "widgets"}),
    awful.key({ modkey, "Shift" }, "c", _G.ToggleCPUPopUP,
                {description = "toggle cpu widget popup", group = "widgets"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_toggle = {description = "toggle tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
    end
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  descr_toggle),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if _G.client.focus then
                          local tag = _G.client.focus.screen.tags[i]
                          if tag then
                              _G.client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  descr_move),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if _G.client.focus then
                          local tag = _G.client.focus.screen.tags[i]
                          if tag then
                              _G.client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  descr_toggle_focus)
    )
end

return globalkeys
