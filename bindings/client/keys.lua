local awful = require('awful')
local gears = require('gears')

local keys = require('variables.keys')

local _M = {
   clientkeys = gears.table.join(
      awful.key({ keys.super,           }, "f",
      function (c)
         c.fullscreen = not c.fullscreen
         c:raise()
      end,
      {description = "toggle fullscreen", group = "client"}),
         awful.key({ keys.super, "Shift"   }, "c",      function (c) c:kill()                         end,
      {description = "close", group = "client"}),
         awful.key({ keys.super, "Control" }, "space",  awful.client.floating.toggle                     ,
      {description = "toggle floating", group = "client"}),
         awful.key({ keys.super, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
      {description = "move to master", group = "client"}),
         awful.key({ keys.super,           }, "o",      function (c) c:move_to_screen()               end,
      {description = "move to screen", group = "client"}),
         awful.key({ keys.super,           }, "t",      function (c) c.ontop = not c.ontop            end,
      {description = "toggle keep on top", group = "client"}),
         awful.key({ keys.super,           }, "n",
         function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
         end ,
      {description = "minimize", group = "client"}),
         awful.key({ keys.super,           }, "m",
            function (c)
               c.maximized = not c.maximized
               c:raise()
            end ,
      {description = "(un)maximize", group = "client"}),
         awful.key({ keys.super, "Control" }, "m",
            function (c)
               c.maximized_vertical = not c.maximized_vertical
               c:raise()
            end ,
      {description = "(un)maximize vertically", group = "client"}),
         awful.key({ keys.super, "Shift"   }, "m",
            function (c)
               c.maximized_horizontal = not c.maximized_horizontal
               c:raise()
            end,
      {description = "(un)maximize horizontally", group = "client"})
   )
}

return _M
