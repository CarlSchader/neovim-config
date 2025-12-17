{ flake-utils, ... }@inputs:
flake-utils.lib.meld inputs [
  ./nixos-modules.nix
  ./packages.nix
]
