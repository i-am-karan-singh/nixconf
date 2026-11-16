{ lib, ... }: {
	networking.hostName = "thinkpad";

	hardware.nvidia.prime = {
		offload.enable = true;
		intelBusId = lib.mkDefault "PCI:0:2:0";
		nvidiaBusId = lib.mkDefault "PCI:1:0:0";
	};

	system.stateVersion = "26.05";
}
