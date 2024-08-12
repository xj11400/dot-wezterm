local wezterm = require("wezterm")
local platform = require("zx.utils.platform")


-- /Users/xjhsu/Library/Fonts/MesloLGSNerdFontMono-Regular.ttf, CoreText
local _font = {
    family = "MesloLGS Nerd Font Mono",
    weight = "Regular",
    stretch = "Normal",
    style = "Normal"
}
-- local _font_size = platform().is_mac and 12 or 11

return {
    font = wezterm.font_with_fallback {
        _font,
        'JetBrains Mono',
        'Noto Color Emoji'
    },
    --  font_size = _font_size,
}
