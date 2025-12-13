{ flake-utils, ... }@inputs:
flake-utils.lib.meld inputs [
  ./overlays.nix
  ./packages.nix
]
