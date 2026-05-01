{ nixpkgs, flake-utils, ... }@inputs:
flake-utils.lib.eachDefaultSystem (
  system:
  let
    pkgs = import nixpkgs { inherit system; };
    extraPackages = import ./extra-packages.nix { inherit pkgs; };
  in
  {
    devShells.default = pkgs.mkShell {
      buildInputs = extraPackages;
    };
  }
)
