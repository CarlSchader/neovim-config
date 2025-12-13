{ ... }:
{
  nixosModules.default = { ... }:
  {
    xdg.configFile."nvim".source = ./.;
  };
}
  
