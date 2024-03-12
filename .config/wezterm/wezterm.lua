-- Pull in the wezterm API
local wezterm = require("wezterm")

local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.leader = { key = "a", mods = "CTRL" }

-- config.disable_default_key_bindings = true
-- config.debug_key_events = true

config.keys = {
	{
		key = "P",
		mods = "SUPER",
		action = wezterm.action.SplitPane({
			direction = "Down",
			-- command = { args = { "top" } },
			size = { Percent = 50 },
		}),
	},
	{
		key = "p",
		mods = "SUPER",
		action = wezterm.action.SplitPane({
			direction = "Right",
			-- command = { args = { "top" } },
			size = { Percent = 50 },
		}),
	},
	{
		key = "]",
		mods = "SUPER",
		action = act.PaneSelect,
	},
	-- {
	-- 	key = "p",
	-- 	mods = "SUPER",
	-- 	action = act.ActivateCommandPalette,
	-- },
	{
		key = "c",
		mods = "SUPER",
		action = act.CopyTo("ClipboardAndPrimarySelection"),
	},
	{
		key = "v",
		mods = "SUPER",
		action = act.PasteFrom("PrimarySelection"),
	},
	{
		key = "q",
		mods = "SUPER",
		action = act.QuitApplication,
	},
	{
		key = "g",
		mods = "SUPER",
		action = act.SendString("lazyGit\n"),
	},

	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "l",
		mods = "SUPER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "j",
		mods = "SUPER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "k", mods = "SUPER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "h",
		mods = "SUPER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "K",
		mods = "CTRL|SHIFT",
		action = act.ClearScrollback("ScrollbackAndViewport"),
	},
}

config.adjust_window_size_when_changing_font_size = false

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Monokai Pro (Gogh)'

config.tab_bar_at_bottom = true
-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85

config.window_padding = {
	left = "20px",
	right = "20px",
	top = "20px",
	bottom = "20px",
}

-- config.window_frame = {
-- 	border_left_width = "0.5cell",
-- 	border_right_width = "0.5cell",
-- 	border_bottom_height = "0.25cell",
-- 	border_top_height = "0.25cell",
-- 	border_left_color = "purple",
-- 	border_right_color = "purple",
-- 	border_bottom_color = "purple",
-- 	border_top_color = "purple",
-- }

config.font_size = 16

-- wezterm.on("user-var-changed", function(window, pane, name, value)
-- 	local overrides = window:get_config_overrides() or {}
-- 	if name == "ZEN_MODE" then
-- 		local incremental = value:find("+")
-- 		local number_value = tonumber(value)
-- 		if incremental ~= nil then
-- 			while number_value > 0 do
-- 				window:perform_action(wezterm.action.IncreaseFontSize, pane)
-- 				number_value = number_value - 1
-- 			end
-- 			overrides.enable_tab_bar = false
-- 		elseif number_value < 0 then
-- 			window:perform_action(wezterm.action.ResetFontSize, pane)
-- 			overrides.font_size = nil
-- 			overrides.enable_tab_bar = true
-- 		else
-- 			overrides.font_size = number_value
-- 			overrides.enable_tab_bar = false
-- 		end
-- 	end
-- 	window:set_config_overrides(overrides)
-- end)

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		if value == "on" then
			overrides.font_size = 18
		else
			overrides.font_size = nil
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
--
--
--

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
-- function tab_title(tab_info)
-- 	local title = tab_info.tab_title
-- 	-- if the tab title is explicitly set, take that
-- 	if title and #title > 0 then
-- 		return title
-- 	end
-- 	-- Otherwise, use the title from the active pane
-- 	-- in that tab
-- 	return tab_info.active_pane.title
-- end

-- "format-tab-title", function(tab, tabs, panes, config, hover, max_width)
-- 	local edge_background = "#0b0022"
-- 	local background = "#1b1032"
-- 	local foreground = "#808080"
--
-- 	if tab.is_active then
-- 		background = "#2b2042"
-- 		foreground = "#c0c0c0"
-- 	elseif hover then
-- 		background = "#3b3052"
-- 		foreground = "#909090"
-- 	end
--
-- 	local edge_foreground = "transparent"
--
-- 	local title = tab_title(tab)
--
-- 	-- ensure that the titles fit in the available space,
-- 	-- and that we have room for the edges.
-- 	title = wezterm.truncate_right(title, max_width - 2)
--
-- 	return {
-- 		{ Background = { Color = edge_background } },
-- 		{ Foreground = { Color = edge_foreground } },
-- 		{ Text = SOLID_LEFT_ARROW },
-- 		{ Background = { Color = background } },
-- 		{ Foreground = { Color = foreground } },
-- 		-- { Text = title },
-- 		{ Background = { Color = edge_background } },
-- 		{ Foreground = { Color = edge_foreground } },
-- 		{ Text = SOLID_RIGHT_ARROW },
-- 	}
-- end)

config.automatically_reload_config = true

return config
