local wibox = require('wibox')
local wibar = require('widgets.wibar.floating_wibar')
local clk_widget = require('widgets.wibar.topright.clock')
local sys_widget = require('widgets.wibar.topright.system_widget')


local sys_wibar = { mt = {} }

local function new(args)

   return wibar {
      screen = args.s,
      position = 'right',
      widget = wibox.widget {
         {
            {
               sys_widget,
               clk_widget,
               layout = wibox.layout.fixed.horizontal
            },
            --right = 5,
            --left = 5,
            widget = wibox.container.margin
         },
         halign = "right",
         widget = wibox.container.place,
      }
   }
end

function sys_wibar.mt:__call(...)
   return new(...)
end

return setmetatable(sys_wibar, sys_wibar.mt)
