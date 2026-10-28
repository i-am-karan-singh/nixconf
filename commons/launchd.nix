{
	launchd.user.agents.sshfs-arch.serviceConfig = {
		Label = "com.karan.sshfs-arch";

		ProgramArguments = [
			"/usr/local/bin/sshfs"
			"arch:"
			"/Users/karan/arch"
			"-f"
			"-o"
			"reconnect,ServerAliveInterval=15,ServerAliveCountMax=3,volname=arch"
		];

		RunAtLoad = true;
		KeepAlive = true;
		ThrottleInterval = 30;
	};
}
