local wibox = require('wibox')

local _M = wibox.widget {
   {
      {
         format = "%d/%m/%Y",
         widget = wibox.widget.textclock,
      },
      {
         format = "%k:%M",
         widget = wibox.widget.textclock,
      },
      spacing = 10,
      spacing_widget = wibox.widget.separator,
      layout = wibox.layout.fixed.horizontal
   },
   widget = wibox.container.constraint
}

return _M
