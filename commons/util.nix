{ pkgs, ... }: {
	programs = {
		fzf.enable = true;
		zoxide.enable = true;
		fd.enable = true;
		ripgrep.enable = true;
		ripgrep-all.enable = true;

		uv.enable = true;
		ruff.enable = true;
		npm.enable = true;
		pandoc.enable = true;

		direnv = {
			enable = true;
			nix-direnv.enable = true;
		};

		devenv = {
			enable = true;
			enableFishIntegration = false;	# slow? use eval "$(devenv direnvrc)" && use devenv
			enableZshIntegration = false;
		};

		nix-your-shell = {
			enable = true;
			nix-output-monitor.enable = true;
		};

		nh = {
			enable = true;
			flake = if pkgs.stdenv.hostPlatform.isDarwin then "/Users/karan/Documents/code/nixconf" else "/home/karan/nixconf";
			clean = {
				enable = true;
				dates = "daily";
			};
		};
	};
}
