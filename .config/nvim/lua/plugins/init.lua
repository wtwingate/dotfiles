return {
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"tpope/vim-vinegar",

	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			background = {
				light = "latte",
				dark = "macchiato",
			},
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
					icons_enabled = false,
					theme = "catppuccin",
					component_separators = "|",
					section_separators = "",
				},
			})
		end,
	},
}
