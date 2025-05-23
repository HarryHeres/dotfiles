local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Gruvbox Material (Gogh)'
config.enable_wayland = false
config.tab_bar_at_bottom = true

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0
}

config.font = wezterm.font('FiraCodeNerdFont')
config.font_size = 10

config.leader = { key = 't', mods = 'ALT', timeout_milliseconds = 1000 }
config.default_cwd = '$HOME'

local sessionizer = wezterm.plugin.require "https://github.com/mikkasendke/sessionizer.wezterm"
local schema = {
	wezterm.home_dir .. "/.config/wezterm",
	wezterm.home_dir .. "/.config/nvim",

	sessionizer.FdSearch { wezterm.home_dir .. "/Projects", max_depth = 5 },

	processing = sessionizer.for_each_entry(function(entry)
		entry.label = entry.label:gsub(wezterm.home_dir, "~")
		entry.label = "📁 " .. entry.label
	end)
}



config.keys = {
	{
		key = 'd',
		mods = 'LEADER',
		action = wezterm.action.ActivatePaneDirection 'Up'
	},

	{
		key = 'f',
		mods = 'ALT',
		action = sessionizer.show(schema)
	},

	{
		key = 'k',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection 'Up'
	},

	{
		key = 'j',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection 'Down'
	},

	{
		key = 'h',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection 'Left'
	},

	{
		key = 'l',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection 'Right'
	},

	{
		key = 'x',
		mods = 'LEADER',
		action = wezterm.action.CloseCurrentTab { confirm = true }
	},

	{
		key = 'c',
		mods = 'LEADER',
		action = wezterm.action.SpawnTab 'CurrentPaneDomain'
	},

	{
		key = 'h',
		mods = 'LEADER',
		action = wezterm.action.MoveTabRelative(-1)
	},

	{
		key = 'l',
		mods = 'LEADER',
		action = wezterm.action.MoveTabRelative(1)
	},

	{
		key = 's',
		mods = 'LEADER',
		action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
	},

	{
		key = 'v',
		mods = 'LEADER',
		action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
	},

	{
		key = '1',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(0)
	},

	{
		key = '2',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(1)
	},

	{
		key = '3',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(2)
	},

	{
		key = '4',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(3)
	},

	{
		key = '5',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(4)
	},

	{
		key = '6',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(5)
	},

	{
		key = '7',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(6)
	},

	{
		key = '8',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(7)
	},

	{
		key = '9',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(8)
	},

	{
		key = '0',
		mods = 'LEADER',
		action = wezterm.action.ActivateTab(9)
	},

	{
		key = 'H',
		mods = 'ALT',
		action = wezterm.action.AdjustPaneSize { 'Left', 5 }
	},

	{
		key = 'L',
		mods = 'ALT',
		action = wezterm.action.AdjustPaneSize { 'Right', 5 }
	},

	{
		key = 'J',
		mods = 'ALT',
		action = wezterm.action.AdjustPaneSize { 'Down', 5 }
	},

	{
		key = 'K',
		mods = 'ALT',
		action = wezterm.action.AdjustPaneSize { 'Up', 5 }
	},

	{
		key = 'L',
		mods = 'CTRL',
		action = wezterm.action.DisableDefaultAssignment
	},

	{
		key = 'D',
		mods = 'CTRL',
		action = wezterm.action.ShowDebugOverlay
	},
}

return config
