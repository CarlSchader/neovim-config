# This file contains a derivation for a postgres server to run locally that is used mainly to test the dadbod integration
{
  nixpkgs,
  flake-utils,
  ...
}:
flake-utils.lib.eachDefaultSystem (system: let
  pkgs = import nixpkgs {
    inherit system;
    config = {allowUnfree = true;};
  };
  pg-config = import ./postgres-config.nix {};
  pg = pkgs.postgresql.withPackages (p: [p.pgvector]);
  inherit (pg-config) pg-data-dir pg-port pg-user pg-password pg-db-name;
in {
  packages.pg-server = pkgs.writeShellScriptBin "pg-server" ''
    if [ ! -d "${pg-data-dir}" ]; then
      # temporary password file for initdb to consume
      PWFILE=$(mktemp)
      echo "${pg-password}" > "$PWFILE"

      # initialize db dir
      ${pg}/bin/initdb -D "${pg-data-dir}" -U "${pg-user}" --auth=scram-sha-256 --pwfile="$PWFILE"
      rm -f "$PWFILE"

      # create dev db
      ${pg}/bin/pg_ctl -D "${pg-data-dir}" -o "-p "${pg-port}" -k /tmp" -l "${pg-data-dir}/init.log" -w start
      PGPASSWORD="${pg-password}" ${pg}/bin/createdb -h /tmp -p ${pg-port} -U "${pg-user}" "${pg-db-name}"
      ${pg}/bin/pg_ctl -D "${pg-data-dir}" -m fast -w stop
    fi
    exec ${pg}/bin/postgres -D "${pg-data-dir}" -p "${pg-port}" -k /tmp
  '';
})
