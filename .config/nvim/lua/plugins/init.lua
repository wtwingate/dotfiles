return {
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"tpope/vim-surround",

	{
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {},
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "auto",
			dark_variant = "moon",
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = "|",
					section_separators = "",
				},
			})
		end,
	},
}
