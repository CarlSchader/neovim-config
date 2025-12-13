{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (nixpkgs) lib;
        src = lib.fileset.toSource {
          root = ./.;
          fileset = ./.;
        };
      in
      {
        packages.default = pkgs.runCommand "nvim-config" {} ''
          cp -r ${src} $out
        '';
      }
    );
}
