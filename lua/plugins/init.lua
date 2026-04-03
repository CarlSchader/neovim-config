-- Plugins
return {
	-- Theme Plugins

	-- { 
	-- 	"catppuccin/nvim", 
	-- 	name = "catppuccin", 
	-- 	priority = 1000,
	-- 	config = function() 
	-- 		require("catppuccin")
	-- 		vim.cmd.colorscheme "catppuccin-nvim"
	-- 	end,
	-- },

	-- {
	-- 	"tiagovla/tokyodark.nvim",
	-- 	opts = {
	-- 			-- custom options here
	-- 	},
	-- 	config = function(_, opts)
	-- 			require("tokyodark").setup(opts) -- calling setup is optional
	-- 			vim.cmd [[colorscheme tokyodark]]
	-- 	end,
	-- },

	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false, 
		priority = 1000,
		config = function()
			require("moonfly")
			vim.cmd.colorscheme "moonfly"
		end,
	},

	-- {
	-- 	 "Zeddnyx/gruvbox.nvim",
	-- 	 lazy = false,
	-- 	 priority = 100,
	-- 	 config = function()
	-- 		 vim.cmd("colorscheme gruvbox")
	-- 	 end
	-- },

	----------

	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup {
				options = {
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							text_align = "left",
							separator = true -- use a "true" to enable the default, or set your own character
						}
					},
				},
			}
		end,
	},

	{ 'famiu/bufdelete.nvim', },

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup()
		end,
	},

	{
		'nvim-telescope/telescope.nvim', version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		}
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },

	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		opts = {
			highlight = { enable = true, },
		},
	},

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup {
				options = {
					theme = 'auto',
				},
			}
		end,
	},

	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		-- Because of the keys part, you will be lazy loading this plugin.
		-- The plugin wil only load once one of the keys is used.
		-- If you want to load the plugin at startup, add something like event = "VeryLazy",
		-- or lazy = false. One of both options will work.
		opts = {
				-- your configuration comes here
				-- for example
				enabled = true,  -- if you want to enable the plugin
				message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
				date_format = "%m-%d-%Y", -- template for the date, check Date format section for more options
				virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
		},
	},

	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				suggestion = {
				enabled = true,
				auto_trigger = true,
			},
			panel = { enabled = false },
		})
		end,
	},

	{
    "hrsh7th/nvim-cmp",
    dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local cmp = require("cmp")

			opts.sources = cmp.config.sources({
				{ name = "nvim_lsp", group_index = 2 },
				-- { name = "copilot",  group_index = 2 },
				{ name = "luasnip",  group_index = 2 },
				{ name = "buffer",   group_index = 2 },
				{ name = "nvim_lua", group_index = 2 },
				{ name = "path",     group_index = 2 },
			})

			opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						-- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
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
			})
		end,
  },

	-- needs to be defined after nvim-cmp
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp")
		end,
	},
}
