{ pkgs, ... }: {
	programs = {
		herdr = {
			enable = true;

			settings = {
				onboarding = false;
				terminal.default_shell = "fish";
			};
		};

		codex.enable = true;
		claude-code.enable = true;
		opencode.enable = true;
		pi-coding-agent.enable = true;
	};
}
