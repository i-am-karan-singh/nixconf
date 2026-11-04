{ config, lib, ... }: {
	boot = {
		initrd = {
			availableKernelModules = [ "xhci_pci" "nvme" "uas" "sd_mod" "rtsx_pci_sdmmc" ];
			kernelModules = [ ];
		};
		kernelModules = [ "kvm-intel" ];
		extraModulePackages = [ ];
		kernelParams = [ "acpi_backlight=native" ];
	};

	fileSystems = {
		"/" = {
			device = "/dev/disk/by-label/nixos";
			fsType = "btrfs";
			options = [ "compress=zstd" "subvol=root" ];
		};
		"/home" = {
			device = "/dev/disk/by-label/nixos";
			fsType = "btrfs";
			options = [ "compress=zstd" "subvol=home" ];
		};
		"/nix" = {
			device = "/dev/disk/by-label/nixos";
			fsType = "btrfs";
			options = [ "compress=zstd" "noatime" "subvol=nix" ];
		};
		"/boot" = {
			device = "/dev/disk/by-label/nixboot";
			fsType = "vfat";
			options = [ "fmask=0077" "dmask=0077" "defaults" ];
		};
	};

	swapDevices = [
		{ device = "/dev/disk/by-label/swap"; }
	];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

	hardware = {
		enableRedistributableFirmware = lib.mkDefault true;
		cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
	};
}
