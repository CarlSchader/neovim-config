{
  nixpkgs,
  flake-utils,
  ...
}:
flake-utils.lib.eachDefaultSystem (
  system: let
    pkgs = import nixpkgs {inherit system;};
    extraPackages = import ./extra-packages.nix {inherit pkgs;};
    pg-config = import ./postgres-config.nix {};
    inherit (pg-config) pg-port pg-user pg-password pg-db-name;
  in {
    devShells.default = pkgs.mkShell {
      DBUI_URL = "postgres://${pg-user}:${pg-password}@localhost:${pg-port}/${pg-db-name}";
      buildInputs = extraPackages;
    };
  }
)
