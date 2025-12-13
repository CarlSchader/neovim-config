{ self, ... }:
{
  target-path ? "/etc/xdg/nvim",
}:
{
  nixosModules.default =
    { pkgs, ... }:
    {
      environment.etc.nvim = {
        source = self.${pkgs.system}.packages.default;
        target = target-path;
      };
    };
}
