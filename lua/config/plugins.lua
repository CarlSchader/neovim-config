-- Plugin configuration (shared between nix-managed and lazy.nvim modes)
-- For mode-specific behavior, check vim.env.NIX_NEOVIM

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		offsets = {
			{
				filetype = "neo-tree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})

-- neo-tree
require("neo-tree").setup({
	filesystem = {
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false,
		},
		use_libuv_file_watcher = true,
	},
})

-- image
require("image").setup()

-- mini
-- -- in visual mode sa + <char> surrounds selection in char
require("mini.surround").setup()
-- -- auto types double chars for chars that typically wrap like parens
require("mini.pairs").setup()

-- gitlinker
require("gitlinker").setup({
	opts = {
		remote = nil,
		add_current_line_on_normal_mode = true,
		action_callback = require("gitlinker.actions").copy_to_clipboard,
		print_url = true,
	},
	mappings = "<leader>gy",
})

-- gitsigns
require("gitsigns").setup()

-- indent-blankline
require("ibl").setup()

-- telescope + fzf
require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
		},
	},
})
require("telescope").load_extension("fzf")

-- git-blame
require("gitblame").setup({
	enabled = true,
	message_template = " <summary> • <date> • <author> • <<sha>>",
	date_format = "%m-%d-%Y",
	virtual_text_column = 1,
})

-- which-key
require("which-key").setup({})
vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

-- nvim-cmp
local cmp = require("cmp")
local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	sources = cmp.config.sources({
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "luasnip", group_index = 2 },
		{ name = "buffer", group_index = 2 },
		{ name = "nvim_lua", group_index = 2 },
		{ name = "path", group_index = 2 },
	}),
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.snippet.active({ direction = 1 }) then
				vim.schedule(function()
					vim.snippet.jump(1)
				end)
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.snippet.active({ direction = -1 }) then
				vim.schedule(function()
					vim.snippet.jump(-1)
				end)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})

-- lualine
require("lualine").setup({
	options = {
		theme = "auto",
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "filetype" },
			lualine_y = { "lsp_status", "progress", sources = { "nvim_lsp" } },
			lualine_z = { "location" },
		},
	},
})

-- lazygit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
