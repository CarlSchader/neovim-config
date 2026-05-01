{ pkgs }:
let
  treesitterWithParsers = pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [
    p.c
    p.cpp
    p.lua
    p.rust
    p.python
    p.nix
    p.bash
    p.markdown
    p.markdown_inline
  ]);

  plugins = with pkgs.vimPlugins; [
    # theme
    vim-moonfly-colors

    # ui
    mini-nvim
    bufferline-nvim
    nvim-web-devicons
    bufdelete-nvim
    lualine-nvim
    indent-blankline-nvim
    which-key-nvim
    neo-tree-nvim
    nui-nvim

    # git
    lazygit-nvim
    gitlinker-nvim
    gitsigns-nvim
    git-blame-nvim
    plenary-nvim

    # telescope
    telescope-nvim
    telescope-fzf-native-nvim

    # treesitter
    treesitterWithParsers

    # lsp + completion
    nvim-lspconfig
    conform-nvim
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-nvim-lua
    luasnip
    cmp_luasnip

    # copilot
    copilot-lua
    copilot-cmp
  ];

  neovimConfig = pkgs.neovimUtils.makeNeovimConfig {
    plugins = map (plugin: { inherit plugin; }) plugins;
    extraLuaPackages = ps: [ ps.jsregexp ];
    withPython3 = false;
    withNodeJs = false;
    withRuby = false;
  };
in
pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (
  neovimConfig
  // {
    wrapRc = false;
    wrapperArgs = neovimConfig.wrapperArgs ++ [
      "--set"
      "NIX_NEOVIM"
      "1"
    ];
  }
)
