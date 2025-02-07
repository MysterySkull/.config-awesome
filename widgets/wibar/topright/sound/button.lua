local awful = require('awful')
local gears = require('gears')


local w_btn = gears.table.join(
   awful.button({ }, 3,
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

return w_btn
