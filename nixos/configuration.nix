{ config, lib, pkgs, ... }:
let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
  unstable = import (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz) { config = config.nixpkgs.config; };
in
{
  imports = [
    ./hardware-configuration.nix
    (import "${home-manager}/nixos")
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix";
  networking.networkmanager.enable = true;

  time.timeZone = "US/Eastern";

  nixpkgs.config.allowUnfree = true;
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };
    desktopManager.gnome.enable = true;
  };
  services.printing.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  services.openssh.enable = true;
  services.tailscale = {
    enable = true;
    openFirewall = true;
  };
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    host = "0.0.0.0";
    loadModels = [ "gemma3" ];
    openFirewall = true;
  };
  services.open-webui = {
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
  };
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "karan";
    dataDir = "/home/karan";
    guiAddress = "0.0.0.0:8384";
    settings.gui = {
      user = "";
      password = "";
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

  programs.firefox.enable = true;
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    promptInit = "autoload -U promptinit && promptinit && prompt adam1 && setopt prompt_sp";
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.git = {
    enable = true;
    config.init.defaultBranch = "main";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.users.karan = { pkgs, ... }: {
    home.packages = with pkgs; [
    ];
    programs.git = {
      enable = true;
      userEmail = "i-am-karan-singh@users.noreply.github.com";
      userName = "Karan Singh";
    };
    dconf.settings = {
      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-ac-type = "nothing";
		sleep-inactive-battery-type = "nothing";
      };
      "org/gnome/mutter" = {
        experimental-features = [ "scale-monitor-framebuffer" ];
      };
    };
    home.stateVersion = "25.05";
  };

  environment.systemPackages = with pkgs; [
    wezterm ghostty gnome-tweaks asdbctl efibootmgr uv
  ];

  system.copySystemConfiguration = true;

  system.stateVersion = "25.05";
}
