{ pkgs, ...}: {
	programs.zed-editor = {
		enable = true;
		package = if pkgs.stdenv.hostPlatform.isDarwin then null else pkgs.zed-editor;

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
			"catppuccin-blur" "macos-classic" "jetbrains-themes" "ultimate-dark-neo"
	    "fish" "git-firefly" "html" "lua" "make" "just" "nix" "toml"
	    "latex" "ltex" "typst"
		];
	};
}
