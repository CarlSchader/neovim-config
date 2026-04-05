{ nixpkgs, flake-utils, ... }@inputs:
flake-utils.lib.eachDefaultSystem (
  system:
  let
    pkgs = import nixpkgs { inherit system; };
    inherit (import ./common.nix { inherit pkgs; }) buildInputs;
  in
  {
    devShells.default = pkgs.mkShell {
      inherit buildInputs;
    };
  }
)
