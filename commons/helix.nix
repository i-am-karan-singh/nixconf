{
	programs.helix = {
		enable = true;
		defaultEditor = true;

		settings = {
			theme = "carbon-dark";
			editor = {
				line-number = "relative";
				end-of-line-diagnostics = "hint";
				inline-diagnostics.cursor-line = "warning";
				cursor-shape = {
					insert = "bar";
					normal = "block";
					select = "underline";
				};
				soft-wrap.enable = true;
			};
		};

		languages = {
			language = [{
				name = "typst";
				language-servers = ["tinymist"];
			}];
			language-server.tinymist = {
				command = "tinymist";
				config.exportPdf = "onType";
			};
		};

		themes = {
			carbon-dark = {
				inherits = "carbon";
				"ui.background" = "none";
			};
		};
	};
}
