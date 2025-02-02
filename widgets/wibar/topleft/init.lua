local lybox = require('widgets.wibar.topleft.layoutbox')
local ptbox = require('widgets.wibar.topleft.promptbox')
local rubato = require('rubato')
local tb = require('widgets.wibar.topleft.tagbar')
local wibar = require('widgets.wibar.floating_wibar')
local wibox = require('wibox')

require('widgets.wibar.topleft.tagbar.signals')


local m_wb = { mt = {} }

local redraw = function(self, initial_width, final_width)
   
   local wb_animation = rubato.timed{
      duration = 0.1,
      pos = initial_width,
      easing = rubato.quadradic
   }
   wb_animation:subscribe(function(w)
      self:geometry ({
         width = w
      })
   end)
   wb_animation.target = final_width
end

local function new(args)

   local tagbar = tb()
   local promptbox = ptbox
   local layoutbox = lybox.create_layoutbox(args.s)
   local promptbox_button = wibox.widget{
      {
         text = '\u{f120}',
         widget = wibox.widget.textbox()
      },
      margins = 7.5,
      widget = wibox.container.margin
   }

   local wibar_custom = wibar {
      screen = args.s,
      position = 'left',
      width = tb.get_width() + 30 + 7.5/2 + 30, --TODO: mettre en soft la largeur de la wibox
      widget = wibox.widget{
         layoutbox,
         tagbar,
         promptbox_button,
         promptbox,
         layout = wibox.layout.fixed.horizontal
      }
   }

   awesome.connect_signal('promptbox::ended', function()
      redraw(wibar_custom, 500, tb.get_width() + 30 + 7.5/2 + 30)
   end)

   awesome.connect_signal('promptbox::exec', function()
      redraw(wibar_custom, tb.get_width() + 30 + 7.5/2 + 30 , 500)
   end)

   return wibar_custom
end


function m_wb.mt:__call(...)
   return new(...)
end

return setmetatable(m_wb, m_wb.mt)

