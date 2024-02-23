-- Pull in the wezterm API
local wezterm = require("wezterm")

local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8

config.window_padding = {
	left = "20px",
	right = "20px",
	top = "30px",
	bottom = "20px",
}

config.font_size = 14

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

-- config.keys = {
-- 	-- Turn off the default CMD-m Hide action, allowing CMD-m to
-- 	-- be potentially recognized and handled by the tab
-- 	{
-- 		key = "k",
-- 		mods = "SUPER",
-- 		action = act.ClearScrollback("ScrollbackAndViewport"),
-- 	},
-- }

-- and finally, return the configuration to wezterm
return config
