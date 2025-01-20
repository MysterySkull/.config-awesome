local wibox = require("wibox")
local beautiful = require("beautiful")

local floating_wibar = { mt = {} }

-- constructor
local function new(args)
   --args = args or {}

   local gap = beautiful.useless_gap*2

   local x_position = gap
   local y_position = gap

   local widget_width = 300 --Fixed value to be added TODO


   local wibar = wibox{
      x = x_position,
      y = y_position,
      type = 'dock',
      screen = args.screen,
      width = widget_width,
      height = beautiful.wibar_height,
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
