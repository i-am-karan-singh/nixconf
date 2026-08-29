{
	description = "nixos flake";

	inputs = {
		nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
		home-manager = {
			url = "https://flakehub.com/f/nix-community/home-manager/0.1";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		determinate = {
			url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		helium = {
			url = "github:schembriaiden/helium-browser-nix-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, determinate, helium, ... }:
	let
		configuration = { config, lib, pkgs, ... }: {
			imports = [
				hardwareConfiguration
			];

			boot.loader.systemd-boot.enable = true;
			boot.loader.efi.canTouchEfiVariables = true;
			boot.kernelPackages = pkgs.linuxPackages_latest;

			networking = {
				hostName = "thinkpad";
				networkmanager.enable = true;
			};
			time.timeZone = "US/Eastern";

			environment.systemPackages = with pkgs; [
				neovim helix zed-editor
				ghostty wezterm kitty
				fzf uv ruff nixd nil
				efibootmgr gnome-tweaks rofi xdg-desktop-portal-wlr
				roboto-mono fira-code jetbrains-mono _0xproto
				nerd-fonts.fira-code nerd-fonts.jetbrains-mono nerd-fonts._0xproto
			] ++ [
				helium.packages.${stdenv.hostPlatform.system}.default
			];

			programs = {
				hyprland.enable = true;
				fish.enable = true;
				zsh = {
					enable = true;
					autosuggestions.enable = true;
					promptInit = "autoload -U promptinit && promptinit && prompt adam1 && setopt prompt_sp";
				};
			};

			services = {
				xserver = {
					enable = true;
					videoDrivers = [ "modesetting" "nvidia" ];
				};
				displayManager.gdm.enable = true;
				desktopManager.gnome.enable = true;
				openssh.enable = true;
				printing.enable = true;
				pipewire = {
					enable = true;
					pulse.enable = true;
				};
				fprintd.enable = true;
				fstrim.enable = true;
				tailscale = {
					enable = true;
					openFirewall = true;
				};
			};

			users.users.karan = {
				description = "Karan Singh";
				isNormalUser = true;
				extraGroups = [ "wheel" ];
				packages = with pkgs; [
				];
				shell = pkgs.zsh;
			};
			security.sudo.wheelNeedsPassword = false;

			hardware = {
				graphics.enable = true;
				nvidia = {
					modesetting.enable = true;
					open = true;
					nvidiaSettings = true;
					prime = {
						offload.enable = true;
						intelBusId = lib.mkDefault "PCI:0:2:0";
						nvidiaBusId = lib.mkDefault "PCI:1:0:0";
					};
					powerManagement = {
						enable = true;
						finegrained = true;
					};
				};
			};

			nix = {
				channel.enable =  false;
				settings = {
					experimental-features = "nix-command flakes";
					warn-dirty = false;
				};
			};
			nixpkgs.config.allowUnfree = true;
			system.stateVersion = "26.05";
		};

		homeConfiguration = {
			home-manager = {
				useGlobalPkgs = true;
				users.karan = { config, pkgs, ... }:
				let
					configDir = "/home/karan/nix-darwin/config";
					link = name: config.lib.file.mkOutOfStoreSymlink "${configDir}/${name}";
				in
				{
					xdg.configFile = {
						"ghostty".source = link "ghosttyx";
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
					home.packages = with pkgs; [
					];
					home.stateVersion = "26.05";
				};
			};
		};

		hardwareConfiguration = { config, lib, pkgs, modulesPath, ... }: {
			imports = [
			];

			boot = {
				initrd = {
					availableKernelModules = [ "xhci_pci" "nvme" "uas" "sd_mod" "rtsx_pci_sdmmc" ];
					kernelModules = [ ];
				};
				kernelModules = [ "kvm-intel" ];
				extraModulePackages = [ ];
				kernelParams = [ "acpi_backlight=native" ];
			};

			fileSystems."/" = {
				device = "/dev/disk/by-uuid/ca48285a-d015-44d1-ba4d-958cf326941e";
				fsType = "btrfs";
				options = [ "compress=zstd" "subvol=root" ];
			};

			fileSystems."/home" = {
				device = "/dev/disk/by-uuid/ca48285a-d015-44d1-ba4d-958cf326941e";
				fsType = "btrfs";
				options = [ "compress=zstd" "subvol=home" ];
			};

			fileSystems."/nix" = {
				device = "/dev/disk/by-uuid/ca48285a-d015-44d1-ba4d-958cf326941e";
				fsType = "btrfs";
				options = [ "compress=zstd" "noatime" "subvol=nix" ];
			};

			fileSystems."/boot" = {
				device = "/dev/disk/by-uuid/9FB9-9379";
				fsType = "vfat";
				options = [ "fmask=0077" "dmask=0077" "defaults" ];
			};

			swapDevices = [
				{ device = "/dev/disk/by-uuid/08f1ca1e-7e1a-42c9-b0d8-2e5911dfb17a"; }
			];

			nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
			hardware = {
				enableRedistributableFirmware = lib.mkDefault true;
				cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
			};
		};
	in
	{
		nixosConfigurations.thinkpad = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				configuration
				determinate.nixosModules.default
				home-manager.nixosModules.home-manager
				homeConfiguration
			];
		};
	};
}
