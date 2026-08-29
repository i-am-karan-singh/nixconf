local wezterm = require 'wezterm'

return {
    font = wezterm.font '0xProto Nerd Font Mono',
    font_size = 14,
    color_scheme = 'Arthur',
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    window_background_opacity = 0.8,
    macos_window_background_blur = 7,
    default_prog = { '/run/current-system/sw/bin/fish' },
    ssh_domains = {
        {
            name = 'arch',
            remote_address = 'arch',
            username = 'karan',
            default_prog = { 'fish' },
        },
    },
    default_gui_startup_args = { 'connect', 'arch' },
    keys = {
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
    },
    window_close_confirmation = 'NeverPrompt',
}
