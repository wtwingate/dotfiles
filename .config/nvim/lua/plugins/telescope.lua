return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
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

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<Leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
  end,
}
