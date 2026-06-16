-- Leader keys must be set before any plugin config
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load plugins: nix provides them on the rtp, otherwise lazy.nvim manages them
if not vim.env.NIX_NEOVIM then
	require("config.lazy")
end

-- Plugin configuration (shared between both modes)
require("config.plugins")

-- Load language support
require("config.lang")

-- Load options
require("config.options")

-- Load keybindings
require("config.bindings")

-- Load theme
require("modules.theme").setup()
