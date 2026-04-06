{ ... }:
{
  nixosModules.default =
    { pkgs, ... }:
    let
      inherit (import ./common.nix { inherit pkgs; }) buildInputs treesitterParsers;
    in
    {
      environment.systemPackages = buildInputs;

      environment.etc."xdg/nvim" = {
        source = ./..;
      };
      # TODO: this is untested but it needs to map in lua to vim.fn.stdpath("data") .. "/tree-sitter-parsers"
      # environment.etc."xdg/tree-sitter-parsers" = {
      #   	source = pkgs.symlinkJoin {
      #   	name = "treesitter-parsers";
      #   	paths = treesitterParsers;
      # 	};
      # };
    };

  homeModules.default =
    { pkgs, lib, ... }:
    let
      inherit (import ./common.nix { inherit pkgs; }) buildInputs treesitterParsers;
    in
    {
      home.packages = buildInputs;

      home.sessionVariables = {
        EDITOR = "nvim";
      };

      home.file.".local/share/nvim/tree-sitter-parsers" = {
        source = pkgs.symlinkJoin {
          name = "treesitter-parsers";
          paths = treesitterParsers;
        };
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
