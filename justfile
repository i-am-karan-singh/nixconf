update:
	mv next.lock flake.lock
	nix flake update --output-lock-file next.lock
