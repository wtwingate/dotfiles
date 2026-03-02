return {
  "stevearc/oil.nvim",
  lazy = false,
  keys = {
    { "-", "<Cmd>Oil<CR>", desc = "Open parent directory" },
  },
  opts = {
    columns = { "icon", "permissions", "size", "mtime" },
  },
}
