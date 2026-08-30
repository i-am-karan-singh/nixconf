{ config, pkgs, configDir, ... }: let
	link = name: config.lib.file.mkOutOfStoreSymlink "${configDir}/${name}";
in {
	xdg.configFile = {
		"fish".source = link "fish";
		"ghostty".source = link "ghostty";
		"wezterm".source = link "wezterm";
		"kitty".source = link "kitty";
		"helix".source = link "helix";
		"nvim".source = link "nvim";
		"zed".source = link "zed";
	};

	programs = {
		git = {
			enable = true;
			settings = {
				user.name = "Karan Singh";
				user.email = "i-am-karan-singh@users.noreply.github.com";
				init.defaultBranch = "main";
			};
		};
		jujutsu = {
			enable = true;
			settings = {
				user.name = "Karan Singh";
				user.email = "i-am-karan-singh@users.noreply.github.com";
			};
		};
	};

	gtk = {
		enable = true;
		colorScheme = "dark";
	};

	home.packages = with pkgs; [
	];

	dconf.settings."org/gnome/settings-daemon/plugins/power" = {
		sleep-inactive-ac-type = "nothing";
		sleep-inactive-battery-type = "nothing";
	};

	news.display = "silent";

	nix.package = null;
}
