local gears = require('gears')
local ptbox = require('widgets.wibar.topleft.prompt_widget.prompt_box')
local wibox = require('wibox')
local cr = require('lgi').cairo

local pb_container = { mt = {} }


local function new(args)

   local pt_box = ptbox

   local text = wibox.widget{
      font  = "JetBrains Mono Nerd Font 11",
      text = ' \u{f120} ',
      widget = wibox.widget.textbox
   }

   local container = wibox.widget{
      {
         {
            text,
            pt_box,
            widget = wibox.layout.fixed.horizontal
         },
         visible = true,
         bg = '#00000070',
         forced_width = 700,
         shape = function(cr, w, h)
            gears.shape.rounded_rect(cr, w, h, 6)
         end,
         widget = wibox.container.background
      },
      margins = 5,
      widget = wibox.container.margin,
   }

   return container

end



function pb_container.mt:__call(...)
   return new(...)
end

return setmetatable(pb_container, pb_container.mt)
