{
	home-manager = {
		useGlobalPkgs = true;

		users.karan = { config, ... }: let
			configDir = "/Users/karan/Documents/Code/nixconf/config";
			link = name: config.lib.file.mkOutOfStoreSymlink "${configDir}/${name}";
		in {
			imports = [
				../commons/home-manager.nix
			];

			home.file = {
				".local/share/gtimelog".source = link "gtimelog";
				".local/share/fish/fish_history".source = link "fish_history";
			};

			home.stateVersion = "26.05";
		};
	};
}
