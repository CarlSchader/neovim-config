{ ... }:
{
  target-path ? "/etc/xdg/nvim",
}:
{
  nixosModules.default =
    { ... }:
    {
      environment.etc.nvim = {
        source = ../.;
        target = target-path;
      };
    };
}
