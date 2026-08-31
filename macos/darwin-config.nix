{ inputs, pkgs, ... }: {
	imports = [
		../commons/homebrew.nix
	];

	environment.systemPackages = with pkgs; [
		gtimelog
		nixd nil
	];

	programs.fish.enable = true;

	security.pam.services.sudo_local = {
		enable = true;
		touchIdAuth = true;
		watchIdAuth = true;
	};

	users.users.karan = {
		name = "karan";
		home = "/Users/karan";
		description = "Karan Singh";
	};

	system = {
		defaults = {
			dock = {
				autohide = true;
				wvous-tl-corner = 2;
				wvous-tr-corner = 3;
				wvous-bl-corner = 11;
				wvous-br-corner = 14;
			};
			trackpad = {
				Clicking = true;
				TrackpadThreeFingerDrag = true;
			};
			NSGlobalDomain = {
				AppleInterfaceStyle = "Dark";
				AppleIconAppearanceTheme = "RegularDark";
			};
		};
		primaryUser = "karan";
		configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
		stateVersion = 6;
	};

	nixpkgs = {
		config.allowUnfree = true;
		hostPlatform = "aarch64-darwin";
	};

	nix.enable = false;

	determinateNix = {
		enable = true;
		determinateNixd.telemetry.sentry.endpoint = null;
	};
}
