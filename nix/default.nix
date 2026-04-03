{ flake-utils, ... }@inputs:
flake-utils.lib.meld inputs [
	./dev-shells.nix
  ./nixos-modules.nix
  ./packages.nix
]
