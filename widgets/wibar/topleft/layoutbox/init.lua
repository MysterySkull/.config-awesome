local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')

local _M = {}

_M.create_layoutbox = function(s)

   local layoutbox = awful.widget.layoutbox(s)

   layoutbox:buttons(gears.table.join(
      awful.button({ }, 1, function () awful.layout.inc( 1) end),
      awful.button({ }, 3, function () awful.layout.inc(-1) end))
   )

   local container = wibox.widget {
      {
         widget = layoutbox
      },
      top = 7.5/2,
      bottom = 7.5/2,
      left = 7.5/2,
      right = 7.5/2,
      widget = wibox.container.margin
   }


   return container
end

return _M
