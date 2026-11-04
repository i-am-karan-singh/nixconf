{ pkgs, ... }: {
	programs.kitty = {
		enable = true;

		font = {
			name = "0xProto Nerd Font Mono";
			size = 14.0;
		};

		settings = {
			cursor_trail = 1;
			copy_on_select = "clipboard";
			tab_bar_style = "separator";
			tab_bar_align = "center";
			tab_separator = "\"  |  \"";
			background_opacity = 0.7;
			background_blur = 10;
			macos_option_as_alt = "yes";
			shell = if pkgs.stdenv.hostPlatform.isDarwin then "/run/current-system/sw/bin/fish -P" else "/home/karan/.nix-profile/bin/fish -P";
		};
	};
}
