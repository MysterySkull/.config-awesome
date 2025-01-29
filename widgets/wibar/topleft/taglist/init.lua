local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local gobject = require('gears.object')
local naughty = require('naughty')
local rubato = require('rubato')
local wibox = require('wibox')

local keys = require('variables.keys')

Current_tag = awful.screen.focused().selected_tag.name
Previous_tag = awful.screen.focused().selected_tag.name

local taglist = { mt = {} }

function taglist.get_width(self)
   local width = 9*(self.tag_circle_height + self.tag_circle_margin)+20

   return width
end

function taglist.new(args)
   local s = args.screen

   local taglist_buttons = gears.table.join(
      awful.button({ }, 1, function(t) t:view_only() end),
      awful.button({ keys.super }, 1, function(t)
         if client.focus then
            client.focus:move_to_tag(t)
         end
      end),
      awful.button({ }, 3, awful.tag.viewtoggle),
      awful.button({ keys.super }, 3, function(t)
         if client.focus then
            client.focus:toggle_tag(t)
         end
      end),
      awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
      awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
   )

   local custom_taglist = gobject()
   custom_taglist = {}

   custom_taglist.wibar_height = beautiful.wibar_height
   custom_taglist.tag_circle_height = beautiful.tag_circle_height

   custom_taglist.tag_circle_margin = (custom_taglist.wibar_height - custom_taglist.tag_circle_height) / 2

   custom_taglist.taglist = awful.widget.taglist {
      screen  = s,
      filter  = awful.widget.taglist.filter.all,
      widget_template = {
         {
            {
               text = '',
               widget = wibox.widget.textbox,
            },
            id = 'shape_id',
            --forced_width = wibar_height,
            bg = '#ffffff',
            visible = true,
            shape = gears.shape.rounded_bar,
            widget = wibox.container.background,
         },
         top = custom_taglist.tag_circle_margin,
         bottom = custom_taglist.tag_circle_margin,
         left = custom_taglist.tag_circle_margin / 2,
         right = custom_taglist.tag_circle_margin / 2,
         widget = wibox.container.margin,
         create_callback = function(self, t)
            if t.selected then
               self:get_children_by_id('shape_id')[1].forced_width = custom_taglist.tag_circle_height + 20
            else
               self:get_children_by_id('shape_id')[1].forced_width = custom_taglist.tag_circle_height
            end

            if #t:clients() > 0 then
               self:get_children_by_id('shape_id')[1].bg = '#ffffff'
            else
               self:get_children_by_id('shape_id')[1].bg = '#777777'
            end
         end,
         update_callback = function(self, t)
            Current_tag = awful.screen.focused().selected_tag.name

            --naughty.notify({text = "Current tag" .. Current_tag})
            --naughty.notify({text = "Previous tag" .. Previous_tag}) 

            self.animate_selected = rubato.timed {
               duration = 0.5,
               pos = 15,
               subscribed = function(w)
                  self:get_children_by_id('shape_id')[1].forced_width = w
               end
            }

            self.animate_not_selected = rubato.timed {
               duration = 0.5,
               pos = 35,
               suscribed = function(w)
                  self:get_children_by_id('shape_id')[1].forced_width = w
               end
            }



            if Current_tag == Previous_tag then
               if t.selected then
                  self:get_children_by_id('shape_id')[1].forced_width = 35
               else
                  self:get_children_by_id('shape_id')[1].forced_width = 15
               end
            end

            if Current_tag ~= Previous_tag then
               if t.selected then
                  self:get_children_by_id('shape_id')[1].forced_width = 35
               else
                  self:get_children_by_id('shape_id')[1].forced_width = 15
               end
            end


            if t.name == "9" then
               --naughty.notify({test= 'test'})
               Previous_tag = Current_tag
            end

            -- Là l'idée, c'est de pour chacun des tag, savoir si c'est le même que le selectionné précédament
            -- si c'est le cas, alors on fait la boucle normal
            --
            -- si c'est pas le cas on fait la boucle spé ou
            -- si le tag == précédent on fait une animation desélection
            -- si le tag == curently select alors animation selection
            -- sinon laisse taille normale

            if #t:clients() > 0 then
               self:get_children_by_id('shape_id')[1].bg = '#ffffff'
            else
               self:get_children_by_id('shape_id')[1].bg = '#777777'
            end
         end
      },
      buttons = taglist_buttons,
   }

   return custom_taglist
end

function taglist.mt:__call(...)
   return taglist.new(...)
end

return setmetatable(taglist, taglist.mt)
