{ inputs, pkgs, ... }: {
	imports = [
		./nix.nix
	];

	homebrew = {
		enable = true;
		enableZshIntegration = true;
		enableFishIntegration = true;
		onActivation = {
			extraEnv = {
				HOMEBREW_NO_ANALYTICS = "1";
				HOMEBREW_NO_ENV_HINTS = "1";
			};
			autoUpdate = true;
			upgrade = true;
			cleanup = "zap";
		};
		brews = [
			"neovim" "helix"
			"uv" "ruff" "gh" "jj" "typst" "opencode"
			"fzf" "fd" "ripgrep" "texlab" "tinymist"
		];
		casks =  [
			"helium-browser" "zoom" "slack" "monitorcontrol" "mac-mouse-fix"
			"chatgpt" "claude" "opencode-desktop" "open-webui" "claude-code" "codex"
			"lm-studio-bionic" "lm-studio"
			"ghostty" "wezterm@nightly" "kitty" "zed" "pycharm" "fork"
			"mactex-no-gui" "texifier" "tailscale-app" "balenaetcher"
			"font-roboto-mono" "font-fira-code-nerd-font" "font-jetbrains-mono"
			"font-jetbrains-mono-nerd-font" "font-0xproto" "font-0xproto-nerd-font"
		];
		masApps = {
			"Wipr 2" = 1662217862;
			# Noteful = 1587904334; see https://github.com/mas-cli/mas/issues/321
			TestFlight = 899247664;
			Numbers = 361304891;
			Pages = 361309726;
			Keynote = 361285480;
		};
	};

	environment.systemPackages = with pkgs; [
		gtimelog
		nixd nil
	];

	programs.fish.enable = true;

	security.pam.services.sudo_local = {
		enable = true;
		touchIdAuth = true;
		watchIdAuth = true;
	};

	users.users.karan = {
		name = "karan";
		home = "/Users/karan";
		description = "Karan Singh";
	};

	system = {
		defaults = {
			dock = {
				autohide = true;
				wvous-tl-corner = 2;
				wvous-tr-corner = 3;
				wvous-bl-corner = 11;
				wvous-br-corner = 14;
			};
			trackpad = {
				Clicking = true;
				TrackpadThreeFingerDrag = true;
			};
			NSGlobalDomain = {
				AppleInterfaceStyle = "Dark";
				AppleIconAppearanceTheme = "RegularDark";
			};
		};
		primaryUser = "karan";
		configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
		stateVersion = 6;
	};

	nixpkgs = {
		config.allowUnfree = true;
		hostPlatform = "aarch64-darwin";
	};

	nix.channel.enable =  false;
}
