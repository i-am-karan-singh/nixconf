{
	home-manager = {
		useGlobalPkgs = true;

		extraSpecialArgs = {
			configDir = "/home/karan/nixconf/config";
		};

		users.karan = { ... }: {
			imports = [
				../commons/home-manager.nix
			];

			home.stateVersion = "26.05";
		};
	};
}
