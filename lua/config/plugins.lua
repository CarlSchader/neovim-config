-- Plugin configuration (shared between nix-managed and lazy.nvim modes)
-- For mode-specific behavior, check vim.env.NIX_NEOVIM

-- bufferline
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
require("ibl").setup({
	indent = {
		char = "┊",
	},
})

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

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

			-- For `mini.snippets` users:
			-- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
			-- insert({ body = args.body }) -- Insert at cursor
			-- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
			-- require("cmp.config").set_onetime({ sources = {} })
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]
--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

-- lazydev-nvim
-- must run before lua_ls is loaded
require("lazydev").setup()

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

-- nvim-treesitter-context (sticky headers)
require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	multiwindow = false, -- Enable multiwindow support.
	max_lines = 10, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to show for a single context
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
	on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})
