{ inputs, ... }: {
	home-manager = {
		useGlobalPkgs = true;

		users.karan = {
			imports = [
				inputs.determinate.homeManagerModules.default
				../commons/home-manager.nix
			];

			home.stateVersion = "26.05";
		};
	};
}
