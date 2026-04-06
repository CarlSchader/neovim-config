{ pkgs }:
{
  buildInputs = with pkgs; [
    # base packages
    neovim
    fzf
    ripgrep
    fd

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

  treesitterParsers = pkgs.vimPlugins.nvim-treesitter.withPlugins (
    p: with p; [
      c
      cpp
      lua
      rust
      python
      nix
      markdown
      markdown_inline
    ]
  );
}
