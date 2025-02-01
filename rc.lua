-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

Current_tag = "1"
Previous_tag = "1"

require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")

-- Notification library
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

require("error_handling")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/theme/theme.lua")

require("variables.layouts")

require("bindings.global")

require("rules")

require('signals')
