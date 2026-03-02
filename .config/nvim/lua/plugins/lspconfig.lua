return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {},
    },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "clangd",
          "emmet_language_server",
          "herb_ls",
          "lua_ls",
          "pyright",
          "ruby_lsp",
          "vtsls",
        },
      },
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
      callback = function()
        vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
        vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
      end,
    })
  end,
}
