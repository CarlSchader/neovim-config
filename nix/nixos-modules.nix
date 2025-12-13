{ self, ... }:
{
  nixosModules.default = { pkgs, ... }:
  {
    xdg.configfile."nvim".source = self.packages.${pkgs.system}.default;
  };
}
  
