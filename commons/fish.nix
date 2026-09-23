{
	programs = {
		fish = {
			enable = true;

			interactiveShellInit = ''
				set -U fish_greeting
			'';

			shellInit = ''
				fish_add_path "$HOME/.local/bin"
				fish_add_path "$HOME/.lmstudio/bin"
				set -gx DOCKER_HOST unix:///run/user/1000/podman/podman.sock
			'';

			shellAliases = {
				tailscale-app = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
			};

			binds."ç" = {
				mode = "insert";
				command = "fzf-cd-widget";
			};
		};

		fzf = {
			enable = true;
			enableFishIntegration = true;
			enableZshIntegration = true;
		};

		herdr = {
			enable = true;
			settings = {
				onboarding = false;
				terminal.default_shell = "fish";
			};
		};

		uv.enable = true;
		ruff.enable = true;

		fd.enable = true;
		ripgrep.enable = true;
		ripgrep-all.enable = true;

		opencode.enable = true;
		pi-coding-agent.enable = true;
	};
}
