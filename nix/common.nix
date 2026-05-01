{ pkgs }:
let
  wrappedNeovim = import ./neovim.nix { inherit pkgs; };
in
{
  buildInputs = [
    wrappedNeovim

    # runtime tools neovim shells out to
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
    pkgs.lazygit

    # lsps
    pkgs.rust-analyzer
    pkgs.ty
    pkgs.lua-language-server
    pkgs.nixd
    pkgs.ccls
    pkgs.bash-language-server
    pkgs.markdown-oxide

    # formatters
    pkgs.stylua
    pkgs.rustfmt
    pkgs.nixfmt
    pkgs.ruff
    pkgs.clang-tools
    pkgs.shfmt
    pkgs.dprint
  ];
}
