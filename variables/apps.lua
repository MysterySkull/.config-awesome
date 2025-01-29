local _M = {
   -- This is used later as the default terminal and editor to run.
   term = os.getenv("TERMINAL") or "alacritty",
   editor = os.getenv("EDITOR") or "nvim",
   browser = os.getenv("BROWER") or "firefox",
}

_M.editor_cmd = _M.term .. " -e " .. _M.editor
_M.browser_cmd = _M.term .. " -e " .. _M.browser

return _M
