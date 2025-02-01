local lybox = require('widgets.wibar.topleft.layoutbox')
local ptbox = require('widgets.wibar.topleft.promptbox')
local tb = require('widgets.wibar.topleft.tagbar')
local wibar = require('widgets.wibar.floating_wibar')
local wibox = require('wibox')

require('widgets.wibar.topleft.tagbar.signals')

mypromptbox = ptbox

local _M = {}

_M.create_main_wibar = function(s)

   local tagbar = tb()
   local layoutbox = lybox.create_layoutbox(s)

   wibar {
      screen = s,
      position = 'left',
      width = tb.get_width() + 30 + 500, --TODO: mettre en soft la largeur de la wibox
      widget = wibox.widget{
         layoutbox,
         tagbar,
         mypromptbox,
         layout = wibox.layout.fixed.horizontal
      }
   }
end

return _M

