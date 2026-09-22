{ pkgs, ... }: {
	imports = [
		./ghostty.nix
		./kitty.nix
		./wezterm.nix

		./helix.nix
		./neovim.nix
		./kakoune.nix
		./zed.nix

		./fish.nix
		./git.nix
	];

	gtk = {
		enable = true;
		colorScheme = "dark";
	};

	home.packages = with pkgs; [
		gtimelog typst
		nixd nil texlab tinymist
	];

	dconf.settings."org/gnome/settings-daemon/plugins/power" = {
		sleep-inactive-ac-type = "nothing";
		sleep-inactive-battery-type = "nothing";
	};

	news.display = "silent";

	nix.package = null;
}
