return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    { "mason-org/mason-lspconfig.nvim", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
      callback = function(args)
        vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = args.buf, desc = "LSP go to definition" })
        vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = args.buf, desc = "LSP go to declaration" })
      end,
    })
  end,
}
