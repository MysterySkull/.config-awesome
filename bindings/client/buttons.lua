local awful = require('awful')
local gears = require('gears')

local keys = require('variables.keys')

local _M = {
   clientbuttons = gears.table.join(
      awful.button({ }, 1, function (c)
         c:emit_signal("request::activate", "mouse_click", {raise = true})
      end),
      awful.button({ keys.super }, 1, function (c)
         c:emit_signal("request::activate", "mouse_click", {raise = true})
         awful.mouse.client.move(c)
      end),
      awful.button({ keys.super }, 3, function (c)
         c:emit_signal("request::activate", "mouse_click", {raise = true})
         awful.mouse.client.resize(c)
      end)
   ),
}

return _M
