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
	
	----------

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
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        -- { name = "copilot",  group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      },
    },
  },
}
