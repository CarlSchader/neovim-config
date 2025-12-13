{ self, pkgs, ... }:
{
  target-path ? "/etc/xdg/nvim",
}:
{
  nixosModules.default =
    { ... }:
    {
      environment.etc.nvim = {
        source = self.${pkgs.system}.packages.default;
        target = target-path;
      };
    };
}
