return {
  "stevearc/oil.nvim",
  lazy = false,
  keys = {
    { "-", "<Cmd>Oil<CR>", desc = "Open parent directory" },
  },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
  },
}
