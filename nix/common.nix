{ pkgs }:
{
  buildInputs = with pkgs; [
    # base packages
    neovim
    fzf
    ripgrep
    fd
    luajitPackages.jsregexp
    lazygit

    # lsps
    rust-analyzer
    ty
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
  ];

  # For available parsers, see:
  # https://search.nixos.org/packages?channel=unstable&include_modular_service_options=1&include_nixos_options=1&query=nvim-treesitter-parsers
  treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
    c
    cpp
    lua
    rust
    python
    nix
    bash
    markdown
    markdown_inline
  ];
}
