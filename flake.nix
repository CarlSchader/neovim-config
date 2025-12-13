{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { flake-utils, ... }@inputs:
    flake-utils.lib.meld inputs [
      ./nix
    ];
}
