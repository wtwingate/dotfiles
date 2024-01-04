return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		require("telescope").setup({})
		require("telescope").load_extension("fzf")

		-- Set keymaps for picker functions
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
	end,
}
