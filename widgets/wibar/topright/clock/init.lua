local wibox = require('wibox')
--local beautiful = require('beautiful')

--local clock_height = 25
local clock_font = "Ubuntu Nerd Font Bold 14"

local _M = wibox.widget {
   {
      {
         {
            format = "%k:%M",
            font = clock_font,
            widget = wibox.widget.textclock,
         },
         right = 7.5,
         left = 7.5,
         widget = wibox.container.margin
      },
      halign = "center",
      widget = wibox.container.place
   },
   bg = "#00ffff",
   widget = wibox.container.background
}

return _M
