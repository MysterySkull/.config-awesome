local _M = {}

_M.create_wibars = function(s)
   require('widgets.wibar.topleft').create_main_wibar(s)
   require('widgets.wibar.topright').create_system_wibar(s)
end

return _M
