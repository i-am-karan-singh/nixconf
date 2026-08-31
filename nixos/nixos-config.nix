{ inputs, pkgs, ... }: {
	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
		kernelPackages = pkgs.linuxPackages_latest;
	};

	networking.networkmanager.enable = true;

	time.timeZone = "US/Eastern";

	environment.systemPackages = with pkgs; [
		neovim helix zed-editor
		ghostty wezterm kitty
		fzf uv ruff nixd nil
		efibootmgr gnome-tweaks asdbctl rofi xdg-desktop-portal-wlr
		roboto-mono fira-code jetbrains-mono _0xproto
		nerd-fonts.fira-code nerd-fonts.jetbrains-mono nerd-fonts._0xproto
	] ++ [
		inputs.helium.packages.${stdenv.hostPlatform.system}.default
	];

	programs = {
		hyprland.enable = true;
		fish.enable = true;
		zsh = {
			enable = true;
			autosuggestions.enable = true;
			promptInit = "autoload -U promptinit && promptinit && prompt adam1 && setopt prompt_sp";
		};
		neovim = {
			enable = true;
			defaultEditor = true;
			viAlias = true;
			vimAlias = true;
		};
	};

	services = {
		xserver = {
			enable = true;
			videoDrivers = [ "modesetting" "nvidia" ];
		};
		displayManager.gdm = {
			enable = true;
			autoSuspend = false;
		};
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
		ollama = {
			enable = true;
			host = "0.0.0.0";
			loadModels = [ "gemma3" ];
			openFirewall = true;
		};
		open-webui = {
			enable = true;
			host = "0.0.0.0";
			openFirewall = true;
		};
		syncthing = {
			enable = true;
			openDefaultPorts = true;
			user = "karan";
			dataDir = "/home/karan";
			guiAddress = "0.0.0.0:8384";
			# settings.gui = { user = ""; password = ""; };
		};
	};

	hardware = {
		graphics.enable = true;
		nvidia = {
			modesetting.enable = true;
			open = true;
			nvidiaSettings = true;
			powerManagement = {
				enable = true;
				finegrained = true;
			};
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

	nixpkgs.config = {
		allowUnfree = true;
		cudaSupport = true;
	};
}
