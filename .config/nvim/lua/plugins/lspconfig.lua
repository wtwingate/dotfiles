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
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = {
              "lua/?.lua",
              "lua/?/init.lua",
            },
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        },
      },
    })

    vim.lsp.config("ruby_lsp", {
      mason = false,
      cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
      callback = function()
        vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
        vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
      end,
    })
  end,
}
