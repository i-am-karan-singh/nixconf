local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font '0xProto Nerd Font Mono'

config.font_size = 14
config.color_scheme = 'Arthur'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = 'NeverPrompt'

config.window_background_opacity = 0.8
config.macos_window_background_blur = 50

config.ssh_domains = {
	{
		name = 'arch',
		remote_address = 'arch',
		username = 'karan',
		default_prog = { 'fish' },
	},
}
config.default_gui_startup_args = { 'connect', 'arch' }

config.keys = {
	{
		key = 'w',
		mods = 'CMD',
		action = wezterm.action.CloseCurrentPane { confirm = false },
	},
	{
		key = '`',
		mods = 'CMD',
		action = wezterm.action.SpawnTab { DomainName = 'unix' },
	},
	{
		key = '`',
		mods = 'CMD|SHIFT',
		action = wezterm.action.SpawnTab { DomainName = 'arch' },
	},
}

return config
