{
	description = "nixconf flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
		nix-darwin = {
			url = "github:nix-darwin/nix-darwin/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		helium = {
			url = "github:schembriaiden/helium-browser-nix-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, helium }: {
		darwinConfigurations = {
			"Karans-MacBook-Pro" = nix-darwin.lib.darwinSystem {
			  specialArgs = { inherit inputs; };
				modules = [
					home-manager.darwinModules.home-manager
					./macos
				];
			};
			"Karans-MacBook-Air" = nix-darwin.lib.darwinSystem {
			  specialArgs = { inherit inputs; };
				modules = [
  				home-manager.darwinModules.home-manager
  				./macos
				];
			};
		};

		homeConfigurations."karan" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
			extraSpecialArgs = { configDir = "/home/karan/nixconf/config"; };
      modules = [
        ./linux
      ];
    };

    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
					home-manager.nixosModules.home-manager
					./nixos
					./nixos/thinkpad.nix
				];
			};
			alienware = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
        specialArgs = { inherit inputs; };
				modules = [
					home-manager.nixosModules.home-manager
					./nixos
					./nixos/alienware.nix
				];
			};
    };
	};
}
