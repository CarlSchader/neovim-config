{ ... }:
{
  nixosModules.default =
    { pkgs, ... }:
    let
      inherit (import ./common.nix { inherit pkgs; }) buildInputs;
    in
    {
      environment.systemPackages = buildInputs;

      environment.etc."xdg/nvim" = {
        source = ./..;
      };
    };

  homeModules.default =
    { pkgs, lib, ... }:
    let
      inherit (import ./common.nix { inherit pkgs; }) buildInputs;
    in
    {
      home.packages = buildInputs;

      home.sessionVariables = {
        EDITOR = "nvim";
      };

      xdg.configFile."nvim" = {
        source = lib.cleanSourceWith {
          src = ./..;
          filter = path: type: !(lib.hasPrefix "lazy-lock.json" path);
        };
        recursive = true;
      };
    };
}
