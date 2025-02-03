local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local wibox = require('wibox')

local wb_height = beautiful.wibar_height
local lb_margins = (wb_height - beautiful.layoutbox.size)/2

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
      margins = lb_margins,
      widget = wibox.container.margin
   }


   return container
end

return _M
