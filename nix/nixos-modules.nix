{ ... }:
{
  nixosModules.default = { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      neovim
      tree-sitter
      fzf
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

  homeModules.default = { pkgs, lib, ... }:
  {
    home.packages = with pkgs; [
      neovim
      tree-sitter
      fzf
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
        filter = path: type: !(lib.hasPrefix "lazy-lock.json" path);
      };
      recursive = true;
    };
  };
}
