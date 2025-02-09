local wibox = require('wibox')

local wibar = require('widgets.wibar.floating_wibar')

local clock = require('widgets.wibar.topright.clock')
local sound = require('widgets.wibar.topright.sound')
local battery = require('widgets.wibar.topright.battery')

local sys_wibar = { mt = {} }

local function new(args)

   return wibar {
      screen = args.s,
      position = 'right',
      widget = wibox.widget {
         {
            {
               battery,
               sound,
               clock,
               layout = wibox.layout.fixed.horizontal
            },
            right = 5,
            left = 5,
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
