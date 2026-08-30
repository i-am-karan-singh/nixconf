{
  home-manager = {
  	useGlobalPkgs = true;

    extraSpecialArgs = {
      configDir = "/Users/karan/Documents/Code/nixconf/config";
    };

  	users.karan = { config, configDir, ... }: let
      link = name: config.lib.file.mkOutOfStoreSymlink "${configDir}/${name}";
  	in {
  		imports = [
  			../commons/home-manager.nix
  		];

      home.file = {
        ".local/share/fish" = { source = link "histfile"; };
        ".local/share/gtimelog" = { source = link "gtimelog"; };
      };

  		home.stateVersion = "26.05";
  	};
  };
}
