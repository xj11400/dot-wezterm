local wezterm = require("wezterm")
local _zx = require("zx.theme.zx.palette.zxpalette")

local M = {}

M.setup = function()
    wezterm.on("format-tab-title",
        function(tab, tabs, panes, config, hover, max_width)
            local background = _zx.base.cyan
            local foreground = _zx.base.bright_cyan

            if tab.is_active then
                background = _zx.base.blue
                foreground = _zx.base.bg_4
            elseif hover then
                background = _zx.base.cyan
                foreground = _zx.base.bg
            end

            local title = tostring(tab.tab_index + 1)
            return {
                { Foreground = { Color = background } },
                { Text = "█" },
                { Background = { Color = background } },
                { Foreground = { Color = foreground } },
                { Text = title },
                { Foreground = { Color = background } },
                { Text = "█" },
            }
        end)
end

return M
