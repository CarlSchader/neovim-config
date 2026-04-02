-- Plugins
return {
	{
			'nvim-telescope/telescope.nvim', version = '*',
			dependencies = {
					'nvim-lua/plenary.nvim',
					-- optional but recommended
					{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			}
	},

	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		opts = {
			highlight = { enable = true, },
		},
	},

	-- {
	--    "zbirenbaum/copilot.lua",
	--    event = "InsertEnter",
	--    cmd = "Copilot",
	--    config = function()
	--      require("copilot").setup({
	--        suggestion = {
	--          enabled = true,
	--          auto_trigger = true,
	--        },
	--        panel = { enabled = false },
	--      })
	--    end,
	--  },

	{
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- {
      --   "zbirenbaum/copilot-cmp",
      --   config = function()
      --     require("copilot_cmp").setup()
      --   end,
      -- },
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
