return {
  "stevearc/oil.nvim",
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
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
