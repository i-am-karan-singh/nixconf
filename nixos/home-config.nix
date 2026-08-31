{
	home-manager = {
		useGlobalPkgs = true;

		users.karan = {
			imports = [
				../commons/home-manager.nix
			];

			home.stateVersion = "26.05";
		};
	};
}
