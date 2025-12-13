{ flake-utils, ... }@inputs:
flake-utils.lib.meld inputs [
  ./packages.nix
]
