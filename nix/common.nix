{ pkgs }:
{
  buildInputs = with pkgs; [
    # base packages
    neovim
    tree-sitter
    fzf
    ripgrep

    # lsps
    rust-analyzer
    ty
    lua-language-server
    nixd
    ccls

    # formatters
    stylua
    rustfmt
    nixfmt
    ruff
    clang-tools
  ];
}
