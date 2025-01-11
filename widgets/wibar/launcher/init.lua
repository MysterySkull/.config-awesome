local awful = require('awful')
local beautiful = require('beautiful')

local apps = require('variables.apps')

local hotkeys_popup = require("awful.hotkeys_popup")

local myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", apps.term .. " -e man awesome" },
   { "edit config", apps.editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

local mymainmenu = awful.menu({
   items = {
      { "awesome", myawesomemenu, beautiful.awesome_icon },
      { "open terminal", apps.term }
   },
})

return awful.widget.launcher({
   image = beautiful.awesome_icon,
   menu = mymainmenu
})

