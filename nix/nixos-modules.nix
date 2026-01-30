{ ... }:
{
  nixosModules.default = { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      neovim
      ripgrep
      rust-analyzer
      ty
      typescript-language-server
      lua-language-server
      nixd
      ccls
    ];

    environment.etc."xdg/nvim" = {
      source = ./..;
    };
  };

  nixosModules.home-manager = { pkgs, lib, ... }:
  {
    home.packages = with pkgs; [
      neovim
      ripgrep
      rust-analyzer
      ty
      typescript-language-server
      lua-language-server
      nixd
      ccls
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    xdg.configFile."nvim" = {
      source = lib.cleanSourceWith {
        src = ./..;
        filer = path: type: !(lib.hasPrefix "lazy-lock.json" path);
      };
      recursive = true;
    };
  };
}
