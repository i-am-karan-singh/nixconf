{ pkgs, ... }: {
	nix = {
		package = pkgs.lix;
		channel.enable =  false;
		settings = {
		  experimental-features = "nix-command flakes";
		  warn-dirty = false;
		};
	};
}
