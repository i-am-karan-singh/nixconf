{ inputs, pkgs, ... }: {
	home-manager = {
		useGlobalPkgs = true;

		users.karan = { config, ... }: let
			configDir = "/Users/karan/Documents/Code/nixconf/config";
			downloadDir = "/Users/karan/Library/Mobile Documents/com~apple~CloudDocs/Downloads";
			link = config.lib.file.mkOutOfStoreSymlink;
		in {
			imports = [
				../commons/home-manager.nix
			];

			home.packages = [
				inputs.gtimelog-mac.packages.${pkgs.stdenv.hostPlatform.system}.default
				inputs.koreader-mac.packages.${pkgs.stdenv.hostPlatform.system}.default
			];

			home.file = {
				".local/share/gtimelog".source = link "${configDir}/gtimelog";
				".local/share/fish/fish_history".source = link "${configDir}/fish_history";
				"Download".source = link downloadDir;
			};

			home.stateVersion = "26.05";
		};
	};
}
