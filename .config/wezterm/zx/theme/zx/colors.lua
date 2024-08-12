local _zx = require("zx.theme.zx.palette.zxpalette")
local M = {}

local hex_To_rgba = function(hex, alpha)
  -- Remove the hash (#) at the start if it's there
  hex = hex:gsub("#", "")

  -- Convert hex to RGB
  local r = tonumber("0x" .. hex:sub(1, 2)) or 0
  local g = tonumber("0x" .. hex:sub(3, 4)) or 0
  local b = tonumber("0x" .. hex:sub(5, 6)) or 0

  -- Return the RGBA string
  -- Default alpha to 1 if not provided
  return "rgba(" .. r .. "," .. g .. "," .. b .. "," .. (alpha or 1) .. ")"
end

M.colors = {
  -- The default text color
  foreground = _zx.base.fg,
  -- The default background color
  background = _zx.base.bg,

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = _zx.base.fg_1,
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = _zx.base.bg_1,
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  cursor_border = _zx.base.fg_1,

  -- the foreground color of selected text
  selection_fg = "black",
  -- the background color of selected text
  selection_bg = _zx.colors.yellow_4,

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = _zx.colors.black_1,

  -- The color of the split lines between panes
  split = _zx.base.bg_1,

  ansi = {
    _zx.base.black,
    _zx.base.red,
    _zx.base.green,
    _zx.base.yellow,
    _zx.base.blue,
    _zx.base.magenta,
    _zx.base.cyan,
    _zx.base.white,
  },
  brights = {
    _zx.base.bright_black,
    _zx.base.bright_red,
    _zx.base.bright_green,
    _zx.base.bright_yellow,
    _zx.base.bright_blue,
    _zx.base.bright_magenta,
    _zx.base.bright_cyan,
    _zx.base.bright_white,
  },

  -- Arbitrary colors of the palette in the range from 16 to 255
  indexed = { [136] = _zx.colors.yellow_1 },

  -- Since: 20220319-142410-0fcdea07
  -- When the IME, a dead key or a leader key are being processed and are effectively
  -- holding input pending the result of input composition, change the cursor
  -- to this color to give a visual cue about the compose state.
  compose_cursor = _zx.colors.orange_0,

  -- Colors for copy_mode and quick_select
  -- available since: 20220807-113146-c2fee766
  -- In copy_mode, the color of the active text is:
  -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
  -- 2. selection_* otherwise
  copy_mode_active_highlight_bg = { Color = "#000000" },
  -- use `AnsiColor` to specify one of the ansi color palette values
  -- (index 0-15) using one of the names "Black", "Maroon", "Green",
  --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
  -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
  copy_mode_active_highlight_fg = { AnsiColor = "Black" },
  copy_mode_inactive_highlight_bg = { Color = _zx.colors.green_0 },
  copy_mode_inactive_highlight_fg = { AnsiColor = "White" },

  quick_select_label_bg = { Color = "peru" },
  quick_select_label_fg = { Color = "#ffffff" },
  quick_select_match_bg = { AnsiColor = "Navy" },
  quick_select_match_fg = { Color = "#ffffff" },

  ----------------------------------------------------------------------------------------------------
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = "None",

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = _zx.base.bg,
      -- The color of the text for the tab
      fg_color = _zx.base.fg,

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = "Normal",

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = "None",

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = _zx.base.bg,
      fg_color = "#808080",

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = _zx.base.bg_4,
      fg_color = "#909090",
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = _zx.base.bg,
      fg_color = "#808080",

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = _zx.base.bg_4,
      fg_color = "#909090",
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}

return M
