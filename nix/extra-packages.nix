{ pkgs }:
with pkgs;
[
  # runtime tools neovim shells out to
  fzf
  ripgrep
  fd
  lazygit

  # image.nvim
  imagemagick
  curl

  # lsps
  rust-analyzer
  ty
  pyright
  lua-language-server
  nixd
  ccls
  bash-language-server
  markdown-oxide

  # formatters
  stylua
  rustfmt
  nixfmt
  ruff
  clang-tools
  shfmt
  dprint
]
