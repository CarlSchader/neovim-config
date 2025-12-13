{ self, ... }:
{
  nixosModules.default =
    { pkgs, ... }:
    {
      environment.etc."xdg/nvim" = {
        source = self.packages.${pkgs.system}.default;
      };
    };
}
