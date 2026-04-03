-- LSP config

-- valid servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local servers = {
	"rust_analyzer",
	"ty",
	"ts_ls",
	"nixd",
	"lua_ls",
	"ccls",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(servers) do
	vim.lsp.config(server, {
		capabilities = capabilities,
	})
	vim.lsp.enable(server)
end
