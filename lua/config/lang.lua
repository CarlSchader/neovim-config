-- Language Support Features
--
-- -- Make sure that common.nix buildInputs has packages for all of these lsps and formatters.

-- LSP config

-- valid servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local servers = {
	"rust_analyzer",
	"ty",
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

-- Formatters

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format" },
		nix = { "nixfmt" },
		rust = { "rustfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
