-- Load lazy.nvim
require("config.lazy")

-- Load language support
require("config.lang")

-- Load tree-sitter parsers (see /nix/nixos-modules.nix)
-- Currently this config doesn't use nvim-treesitter to auto install and load parsers. Instead we just expect the use (or nix) to put parsers in the path below.
-- Parsers are literally just a bunch of shared object files.
vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/tree-sitter-parsers")

-- Load options
require("config.options")

-- Load keybindings
require("config.bindings")
