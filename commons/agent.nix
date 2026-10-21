{ pkgs, ... }: {
	programs = {
		herdr = {
			enable = true;

			settings = {
				onboarding = false;
				terminal.default_shell = "fish";
			};
		};

		opencode.enable = true;
		pi-coding-agent.enable = true;
	};
}
