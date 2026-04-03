-- LSP config

-- valid servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local servers = {
	"rust_analyzer",
	"ty",
	"ts_ls",
	"nixd",
	"lua_ls",
}

for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end
