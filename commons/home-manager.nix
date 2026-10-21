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
		./util.nix
		./git.nix
		./agent.nix
	];

	gtk = {
		enable = true;
		colorScheme = "dark";
	};

	home.packages = with pkgs; [
		nixd nil typst texlab tinymist just
		roboto-mono fira-code jetbrains-mono _0xproto
	] ++ (with pkgs.nerd-fonts; [
		roboto-mono fira-code jetbrains-mono _0xproto
	]);

	fonts.fontconfig.enable = true;

	dconf.settings."org/gnome/settings-daemon/plugins/power" = {
		sleep-inactive-ac-type = "nothing";
		sleep-inactive-battery-type = "nothing";
	};

	news.display = "silent";

	nix.package = null;
}
