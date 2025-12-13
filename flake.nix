{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        inherit (nixpkgs) lib;
        pkgs = import nixpkgs { inherit system; };
        src = lib.fileset.toSource {
          root = ./.;
          fileset = ./.;
        };
      in
      {
        packages.default = pkgs.runCommand "nvim-config" { } ''
          cp -r ${src} $out
        '';
      }
    );
}
