local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local naughty = require('naughty')

local clk_widget = { mt = {} }

local function new()

   local get_volume = function(tooltip)

      awful.spawn.easy_async_with_shell('pulsemixer --get-mute', function(stdout)
         if(stdout == "0\n") then
            awful.spawn.easy_async_with_shell('pulsemixer --get-volume', function(stdout)
               tooltip.text = stdout
            end)
         else
            tooltip.text = "Mute"
         end
      end)
   end

   local w_btn = gears.table.join(
      awful.button({ }, 1,
         function()
            awful.spawn.easy_async_with_shell('pulsemixer --toggle-mute', function() end)
            awesome.emit_signal("volume::changed")
         end
      ),
      awful.button({ }, 4,
         function()
            awful.spawn.easy_async_with_shell('pulsemixer --change-volume +1', function() end)
            awesome.emit_signal("volume::changed")
         end
      ),
      awful.button({ }, 5,
         function()
            awful.spawn.easy_async_with_shell('pulsemixer --change-volume -1', function() end)
            awesome.emit_signal("volume::changed")
         end
      )
   )

   local sound_icon = "\u{f057e} "

   local w = wibox.widget{
      text = sound_icon,
      buttons = w_btn,
      widget = wibox.widget.textbox
   }

   local w_tooltip = awful.tooltip{
      objects = { w },
   }

   w:connect_signal('mouse::enter', function()
      get_volume(w_tooltip)
   end)

   awesome.connect_signal('volume::changed', function()
      get_volume(w_tooltip)
   end)

   return w
end

function clk_widget.mt:__call(...)
   return new(...)
end

return setmetatable(clk_widget, clk_widget.mt)
