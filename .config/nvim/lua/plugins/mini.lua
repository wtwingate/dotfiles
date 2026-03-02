return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()
    require("mini.ai").setup()
    require("mini.icons").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup()
  end,
}
