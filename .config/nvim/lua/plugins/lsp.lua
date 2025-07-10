return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      { "mason-org/mason-lspconfig.nvim", opts = {} },
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
        callback = function()
          vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
          vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
        end,
      })
      vim.diagnostic.config({
        severity_sort = true,
        signs = true,
        virtual_text = true,
      })
    end,
  },
}
