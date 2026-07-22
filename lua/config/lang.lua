-- Language Support Features
--
-- -- Make sure that common.nix buildInputs has packages for all of these lsps and formatters.
-- -- Also make sure common.nix buildInputs has the correct treesitter parsers

-- LSP config

-- valid servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local servers = {
	"rust_analyzer",
	"ty",
	"nixd",
	"lua_ls",
	"bashls",
	"markdown_oxide",
	"clangd",
	"terraformls",
	-- "sourcekit",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.filetype.add({
	extension = {
		cu = "cuda",
		cuh = "cuda",
	},
})

for _, server in ipairs(servers) do
	vim.lsp.config(server, {
		capabilities = capabilities,
	})
	vim.lsp.enable(server)
end

-- special lsp configs
vim.lsp.config("pyright", { -- pyright used only for rename; ty handles everything else
	capabilities = capabilities,
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				diagnosticMode = "off",
			},
		},
	},
	on_init = function(client)
		local keep = { renameProvider = true, textDocumentSync = true, positionEncoding = true }
		for cap in pairs(client.server_capabilities) do
			if not keep[cap] then
				client.server_capabilities[cap] = nil
			end
		end
	end,
})
vim.lsp.enable("pyright")

-- Formatters
-- See this list for available formatters
-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_format" },
		nix = { "alejandra" },
		rust = { "rustfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		bash = { "shfmt" },
		sh = { "shfmt" },
		markdown = { "dprint" },
		swift = { "swiftformat" },
		terraform = { "terraform_fmt" },
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

vim.diagnostic.config({
	virtual_text = true, -- LSP shows errors inline with the code
	signs = true, -- LSP shows errors in the gutter
	underline = true, -- LSP underlines errors in the code
	update_in_insert = false, -- Don't update diagnostics while in insert mode
})
