-- Pull in the wezterm API
local wezterm = require 'wezterm'

local act = wezterm.action


-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.font_size = 14


config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'k',
    mods = 'SUPER',
    action = act.ClearScrollback 'ScrollbackAndViewport',
  }
}

-- and finally, return the configuration to wezterm
return config
