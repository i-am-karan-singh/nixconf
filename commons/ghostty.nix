{ pkgs, ... }: {
	programs.ghostty = {
		enable = true;
		package = if pkgs.stdenv.hostPlatform.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

		settings = {
			background = "000000";
			foreground = "ffffff";
			background-opacity = 0.7;
			background-blur = 10;

			macos-titlebar-style = "native";

			keybind = [
				"ctrl+\\=close_surface"
				"ctrl+|=new_split:right"
			];

			font-family = "0xProto Nerd Font Mono";
			font-size = 14;

			command = if pkgs.stdenv.hostPlatform.isDarwin then "/run/current-system/sw/bin/fish" else "/home/karan/.nix-profile/bin/fish";
			shell-integration = "fish";

			theme = "Xcode Dark";

			auto-update = "download";
			auto-update-channel = "stable";
		};
	};
}
