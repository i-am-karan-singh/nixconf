{ ... }: {
	extraSpecialArgs = {
    configDir = "/home/karan/nixconf/config";
  };

  imports = [
		../commons/home-manager.nix
  ];

  home = {
    username = "karan";
    homeDirectory = "/home/karan";
    stateVersion = "26.05";
  };
}
