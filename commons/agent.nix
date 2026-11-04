{
	programs = {
		herdr = {
			enable = true;
			mutableSettings = true;

			settings = {
				onboarding = false;
				terminal.default_shell = "fish";
			};
		};

		pi-coding-agent = {
			enable = true;
			mutableSettings = true;

			settings.packages = [ "https://github.com/earendil-works/pi-claude-code" ];
		};

		opencode.enable = true;
		codex.enable = true;
		claude-code.enable = true;
	};
}
