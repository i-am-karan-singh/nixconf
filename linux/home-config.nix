{
	imports = [
		../commons/home-manager.nix
	];

	programs.home-manager.enable = true;

	home = {
		username = "karan";
		homeDirectory = "/home/karan";
		stateVersion = "26.05";
	};
}
