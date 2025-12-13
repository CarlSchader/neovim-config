{ ... }:
{
  nixosModules.default = { ... }:
  {
    xdg.configfile."nvim".source = ./.;
  };
}
  
