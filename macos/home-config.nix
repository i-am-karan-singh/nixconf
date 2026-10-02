{
	home-manager = {
		useGlobalPkgs = true;

		users.karan = { config, ... }: let
			configDir = "/Users/karan/Documents/Code/nixconf/config";
			downloadDir = "/Users/karan/Library/Mobile Documents/com~apple~CloudDocs/Downloads";
			link = name: config.lib.file.mkOutOfStoreSymlink "${name}";
		in {
			imports = [
				../commons/home-manager.nix
			];

			home.file = {
				".local/share/gtimelog".source = link "${configDir}/gtimelog";
				".local/share/fish/fish_history".source = link "${configDir}/fish_history";
				"Download".source = link "${downloadDir}";
			};

			home.stateVersion = "26.05";
		};
	};
}
