{
	homebrew = {
		enable = true;
		enableFishIntegration = true;
		enableZshIntegration = true;

		onActivation = {
			extraEnv = {
				HOMEBREW_NO_ANALYTICS = "1";
				HOMEBREW_NO_ENV_HINTS = "1";
			};
			autoUpdate = true;
			upgrade = true;
			cleanup = "zap";
		};

		brews = [
			"herdr"
		];

		casks =  [
			"helium-browser" "zoom" "slack" "monitorcontrol" "mac-mouse-fix"
			"chatgpt" "claude" "opencode-desktop" "claude-code" "codex"
			"lm-studio-bionic" "zed"
			"mactex-no-gui" "texifier" "visual-studio-code" "tailscale-app"
		];

		masApps = {
			"Wipr 2" = 1662217862;
			# Noteful = 1587904334; see https://github.com/mas-cli/mas/issues/321
			TestFlight = 899247664;
			Xcode = 497799835;
			Numbers = 361304891;
			Pages = 361309726;
			Keynote = 361285480;
			"Microsoft Word" = 462054704;
		};
	};
}
