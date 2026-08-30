{
	description = "nixconf flake";

	inputs = {
		nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
		nix-darwin = {
			url = "https://flakehub.com/f/nix-darwin/nix-darwin/0.1";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager = {
			url = "https://flakehub.com/f/nix-community/home-manager/0.1";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		determinate = {
			url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		helium = {
			url = "github:schembriaiden/helium-browser-nix-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, determinate, helium }: {
		darwinConfigurations = {
			"Karans-MacBook-Pro" = nix-darwin.lib.darwinSystem {
				system = "aarch64-darwin";
				specialArgs = { inherit inputs; };
				modules = [
					determinate.darwinModules.default
					determinate.homeManagerModules.default
					home-manager.darwinModules.home-manager
					./macos
				];
			};
			"Karans-MacBook-Air" = nix-darwin.lib.darwinSystem {
				system = "aarch64-darwin";
				specialArgs = { inherit inputs; };
				modules = [
					determinate.darwinModules.default
					determinate.homeManagerModules.default
					home-manager.darwinModules.home-manager
					./macos
				];
			};
		};

		homeConfigurations."karan" = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.x86_64-linux;
			extraSpecialArgs = { configDir = "/home/karan/nixconf/config"; };
			modules = [
				determinate.homeManagerModules.default
				./linux
			];
		};

		nixosConfigurations = {
			thinkpad = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					determinate.nixosModules.default
					determinate.homeManagerModules.default
					home-manager.nixosModules.home-manager
					./nixos
					./nixos/thinkpad.nix
				];
			};
			alienware = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					determinate.nixosModules.default
					determinate.homeManagerModules.default
					home-manager.nixosModules.home-manager
					./nixos
					./nixos/alienware.nix
				];
			};
		};
	};
}
