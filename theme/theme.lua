---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = "~/.config/awesome/theme"

local theme = {}

theme.font          = "JetBrains Mono Nerd Font 10"

-----------------------------
-- TODO COLOR OF THE THEME --
-----------------------------

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(1)
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path.."/background.jpg"

-- You can use your own layout icons like this:
theme.layout_floating  = themes_path.."/layouts/floatingw.png"
theme.layout_tile = themes_path.."/layouts/tilew.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Define top wibars variables
theme.wibar_height = 40

-- Define layoutbox variables
theme.layoutbox = {}
theme.layoutbox.size = 25

-- Define promptbox variables
theme.promptbox = {}
theme.promptbox.size = 25
theme.promptbox.prompt_text = '\u{f120}'

-- Define taglist widget variables
theme.tag_circle = {}
theme.tag_circle.height = 15
theme.tag_circle.unselected_width = 15
theme.tag_circle.selected_width = 35
theme.tag_circle.selection_animation_duration = 0.3

return theme
