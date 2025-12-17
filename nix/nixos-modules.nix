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
}
  
