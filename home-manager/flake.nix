{
  description = "home-manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    homeConfiguration = { config, pkgs, ... }:
    let
      configDir = "/home/karan/nix-darwin/config";
      link = name: config.lib.file.mkOutOfStoreSymlink "${configDir}/${name}";
    in
    {
      home.username = "karan";
      home.homeDirectory = "/home/karan";
      home.stateVersion = "26.05";
      home.packages = with pkgs; [
      ];
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
        home-manager.enable = true;
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
      news.display = "silent";
    };
  in
  {
    homeConfigurations."karan" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
      modules = [
        homeConfiguration
      ];
    };
  };
}
