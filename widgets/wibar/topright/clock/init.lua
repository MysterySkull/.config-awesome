local beautiful = require('beautiful')
local naughty = require('naughty')
local wibox = require('wibox')

local wibar_height = beautiful.wibar.height
local clock_height = beautiful.clock_widget.height
local clock_font = beautiful.clock_widget.font
local clock_widget_margins = (wibar_height - clock_height) / 2 + 0
--local clock_widget_margins = 5

local function clock_font_size(height)
   return math.floor((height/96.0) * 72.0)
end

local _M = wibox.widget {
   {
      {
         {
            format = "%k:%M",
            font = clock_font.. " " ..clock_font_size(clock_height),
            widget = wibox.widget.textclock,
         },
         halign = "center",
         valign = "center",
         widget = wibox.container.place
      },
      bg = "#00ffff",
      widget = wibox.container.background
   },
   margins = clock_widget_margins,
   widget = wibox.container.margin
}

--naughty.notify({text = clock_widget_margins})

return _M
