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

		brews = [];

		casks =  [
			"helium-browser" "zoom" "slack" "monitorcontrol" "mac-mouse-fix"
			"chatgpt" "claude" "opencode-desktop" "open-webui" "claude-code" "codex"
			"lm-studio-bionic" "lm-studio"
			"pycharm" "visual-studio-code" "fork"
			"mactex-no-gui" "texifier" "tailscale-app" "balenaetcher"
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
			"Microsoft PowerPoint" = 462062816;
			"Supernote Partner" = 1494992020;
		};
	};
}
