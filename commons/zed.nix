{
	programs.zed-editor = {
		enable = true;
		mutableUserSettings = true;

		userSettings = {
			hard_tabs = true;
			tab_size = 2;
			ssh_connections = [{
				host = "arch";
				args = [];
				projects = [{
					paths = [
						"/home/karan/nixconf"
					];
				}];
			}];
			scrollbar.show = "never";
			soft_wrap = "editor_width";
			relative_line_numbers = "enabled";
			which_key.enabled = true;
			terminal.shell.program = "fish";
			base_keymap = "Zed";
			telemetry = {
				diagnostics = false;
				metrics = false;
			};
			lsp.tinymist.settings = {
				exportPdf = "onType";
				outputPath = "$root/$name";
			};
		};

		extensions = [
			"catppuccin-blur"
	    "fish"
	    "git-firefly"
	    "html"
	    "jetbrains-themes"
	    "latex"
	    "ltex"
	    "lua"
	    "macos-classic"
	    "make"
			"nix"
	    "toml"
	    "typst"
	    "ultimate-dark-neo"
		];
	};
}
