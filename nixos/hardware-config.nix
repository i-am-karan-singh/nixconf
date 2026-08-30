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
			device = "/dev/nvme0n1p3";
			fsType = "btrfs";
			options = [ "compress=zstd" "subvol=root" ];
		};
		"/home" = {
			device = "/dev/nvme0n1p3";
			fsType = "btrfs";
			options = [ "compress=zstd" "subvol=home" ];
		};
		"/nix" = {
			device = "/dev/nvme0n1p3";
			fsType = "btrfs";
			options = [ "compress=zstd" "noatime" "subvol=nix" ];
		};
		"/boot" = {
			device = "/dev/nvme0n1p1";
			fsType = "vfat";
			options = [ "fmask=0077" "dmask=0077" "defaults" ];
		};
	};

	swapDevices = [
		{ device = "/dev/nvme0n1p2"; }
	];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

	hardware = {
		enableRedistributableFirmware = lib.mkDefault true;
		cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
	};
}
