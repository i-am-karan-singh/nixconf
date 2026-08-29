{
	description = "nixconf flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		nix-darwin = {
			url = "github:nix-darwin/nix-darwin/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nix-darwin, nixpkgs, home-manager }:
	let
		configuration = { pkgs, ... }: {
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
					# "fish"
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
			programs.fish.enable = true;
			environment.systemPackages = with pkgs; [
			  gtimelog
			  nixd nil
			];
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
			nix = {
				package = pkgs.lix;
				channel.enable =  false;
				settings = {
					experimental-features = "nix-command flakes";
					warn-dirty = false;
				};
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
				configurationRevision = self.rev or self.dirtyRev or null;
				stateVersion = 6;
			};
			nixpkgs = {
				config.allowUnfree = true;
				hostPlatform = "aarch64-darwin";
			};
		};

		homeConfiguration = {
			home-manager = {
				useGlobalPkgs = true;
				users.karan = { config, pkgs, ... }:
				let
					configDir = "/Users/karan/Documents/Code/nix-darwin/config";
					link = name: config.lib.file.mkOutOfStoreSymlink "${configDir}/${name}";
				in
				{
					home.file.".local/share/gtimelog".source = link "gtimelog";
					home.file.".local/share/fish".source = link "histfile";
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
					home.stateVersion = "26.05";
				};
			};
		};

		mkSystem = nix-darwin.lib.darwinSystem {
			modules = [
				configuration
				home-manager.darwinModules.home-manager
				homeConfiguration
			];
		};
	in
	{
		darwinConfigurations = {
			"Karans-MacBook-Pro" = mkSystem;
			"Karans-MacBook-Air" = mkSystem;
		};
	};
}
