{ nixpkgs, flake-utils, ... }@inputs:
flake-utils.lib.eachDefaultSystem (system:
let
	pkgs = import nixpkgs { inherit system; };
in
{
	devShells.default = pkgs.mkShell {
		buildInputs = with pkgs; [
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
	};
})
