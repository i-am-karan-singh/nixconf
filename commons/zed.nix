{
	programs.zed-editor = {
		enable = true;
		mutableUserSettings = true;

		userSettings = {
			hard_tabs = true;
			tab_size = 2;
			collaboration_panel.dock = "left";
			outline_panel.dock = "left";
			git_panel.dock = "left";
			project_panel.dock = "left";
			agent = {
				sidebar_side = "right";
				dock = "right";
				favorite_models = [];
				model_parameters = [];
			};
			icon_theme = {
				mode = "light";
				light = "JetBrains New UI Icons (Dark)";
				dark = "JetBrains New UI Icons (Dark)";
			};
			agent_ui_font_size = 14.0;
			ui_font_size = 14.0;
			buffer_font_size = 14.0;
			ssh_connections = [{
				host = "arch";
				args = [];
				projects = [{
					paths = [
						"/home/karan/nixconf"
					];
				}];
			}];
			edit_predictions.provider = "zed";
			scrollbar.show = "never";
			soft_wrap = "editor_width";
			relative_line_numbers = "enabled";
			which_key.enabled = true;
			terminal.shell.program = "fish";
			agent_servers = {
				github-copilot-cli = {
					type = "registry";
				};
				codex-acp = {
					type = "registry";
				};
				claude-acp = {
					type = "registry";
				};
			};
			base_keymap = "VSCode";
			telemetry = {
				diagnostics = false;
				metrics = false;
			};
			theme = {
				mode = "dark";
				light = "Ayu Light";
				dark = "JetBrains Dark";
			};
			lsp.tinymist.settings = {
				exportPdf = "onType";
				outputPath = "$root/$name";
			};
		};

		userKeymaps = [{
			context = "Pane";
			bindings = {
				ctrl-shift-tab = "pane::ActivatePreviousItem";
				ctrl-tab = "pane::ActivateNextItem";
			};
		}];

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
	    "toml"
	    "typst"
	    "ultimate-dark-neo"
		];
	};
}
