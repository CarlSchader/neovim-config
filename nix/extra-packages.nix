{ pkgs }:
[
  # runtime tools neovim shells out to
  pkgs.fzf
  pkgs.ripgrep
  pkgs.fd
  pkgs.lazygit

  # image.nvim
  pkgs.imagemagick
  pkgs.curl

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
]
