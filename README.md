# nixconf

These are my (unified) nix-darwin, home-manager and nixos configs. Here are s'things I have learned:
+ Darwim binaries are slow to build on cache.nixos.org. On unstable especially, use homebrew for zed & herdr.
+ Don't overcommit to nix: keep anything that's not json/yaml separate and symlink.
+ Immutable configs aren't good for experimentation. So for new tools, don't move config to nix too early.
+ Dendritic stuff is overkill for configs this size.
