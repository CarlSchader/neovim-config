{ self, ... }:
{
  nixosModules.default =
    { pkgs, lib, config, ... }:
    {
      options.programs.neovim-config = {
        enable = lib.mkEnableOption "neovim-config";
        targetPath = lib.mkOption {
          type = lib.types.str;
          default = "xdg/nvim";
          description = "Target path relative to /etc/ for the neovim config";
        };
      };

      config = lib.mkIf config.programs.neovim-config.enable {
        environment.etc.${config.programs.neovim-config.targetPath} = {
          source = self.packages.${pkgs.system}.default;
        };
      };
    };
}
