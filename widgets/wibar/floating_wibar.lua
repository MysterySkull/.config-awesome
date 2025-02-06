local beautiful = require("beautiful")
local wibox = require("wibox")

local floating_wibar = { mt = {} }

-- constructor
local function new(args)
   args = args or {}

   local gap = beautiful.useless_gap*2
   local widget_width = args.width or 500
   local x_position, y_position

   -- Set position of the widget
   if args.position == 'right' then
      y_position = gap
      x_position = 1920 - gap - widget_width
   elseif args.position == 'left' then
      x_position = gap
      y_position = gap
   end

   local wibar = wibox{
      x = x_position,
      y = y_position,
      type = 'dock',
      screen = args.screen,
      width = widget_width,
      height = beautiful.wibar_height,
      bg = '#00000080',
      visible = true,
      ontop = false,
      widget = args.widget,
   }

   wibar:struts {
      top = beautiful.wibar_height + gap,
   }

   return wibar
end

function floating_wibar.mt:__call(...)
   return new(...)
end

return setmetatable(floating_wibar, floating_wibar.mt)
