{ flake-utils, ... }@inputs:
flake-utils.lib.meld inputs [
  ./nixos-modules.nix
  ./overlays.nix
  ./packages.nix
]
