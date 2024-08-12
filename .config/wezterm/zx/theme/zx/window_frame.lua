local _zx = require("zx.theme.zx.palette.zxpalette")

local M = {}

M.window_frame = {
  inactive_titlebar_bg = _zx.base.bg,
  active_titlebar_bg = _zx.base.bg,
  inactive_titlebar_fg = "#cc9ccc",
  active_titlebar_fg = _zx.colors.yellow_4,
  inactive_titlebar_border_bottom = _zx.base.bg,
  active_titlebar_border_bottom = _zx.base.bg,
  button_fg = "#98c8cc",
  button_bg = "#2b2042",
  button_hover_fg = "#ffffff",
  button_hover_bg = "#3b3052",
}

return M