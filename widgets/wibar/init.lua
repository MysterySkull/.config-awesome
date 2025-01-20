local _M = {}

_M.create_wibars = function(s)
   require('widgets.wibar.topleft').create_top_left_wibar(s)
end

return _M
