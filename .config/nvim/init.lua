--
--                        ________ ++     ________
--                       /VVVVVVVV\++++  /VVVVVVVV\
--                       \VVVVVVVV/++++++\VVVVVVVV/
--                        |VVVVVV|++++++++/VVVVV/'
--                        |VVVVVV|++++++/VVVVV/'
--                       +|VVVVVV|++++/VVVVV/'+
--                     +++|VVVVVV|++/VVVVV/'+++++
--                   +++++|VVVVVV|/VVVVV/'+++++++++
--                     +++|VVVVVVVVVVV/'+++++++++
--                       +|VVVVVVVVV/'+++++++++
--                        |VVVVVVV/'+++++++++
--                        |VVVVV/'+++++++++
--                        |VVV/'+++++++++
--                        'V/'   ++++++
--                                 ++
--

-- Enable line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Set cursor options
vim.o.cursorline = true
vim.o.scrolloff = 2

-- Set indentation options
vim.o.shiftwidth = 2
vim.o.softtabstop = -1
vim.o.expandtab = true

-- Set line wrap options
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true

-- Set search options
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set status line options
vim.o.laststatus = 2

-- Save undo history
vim.o.undofile = true

-- Define keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "-", "<Cmd>Explore<CR>", { desc = "Explore parent directory" })

-- Define autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("my.vimrc", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
  desc = "Briefly highlight yanked text",
})

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Install and configure plugins
require("lazy").setup({
  spec = {
    "tpope/vim-fugitive",
    "tpope/vim-sleuth",

    {
      "echasnovski/mini.nvim",
      version = false,
      config = function()
        require("mini.ai").setup()
        require("mini.comment").setup()
        require("mini.diff").setup()
        require("mini.icons").setup()
        require("mini.surround").setup()
      end,
    },

    {
      "ellisonleao/gruvbox.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd.colorscheme("gruvbox")
      end,
    },

    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.lsp.enable("clangd")
        vim.lsp.enable("gopls")
        vim.lsp.enable("pyright")
        vim.lsp.enable("ruby_lsp")
        vim.lsp.enable("ts_ls")

        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
          callback = function(args)
            vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = args.buf, desc = "LSP go to definition" })
            vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = args.buf, desc = "LSP go to declaration" })
          end,
        })
      end,
    },

    {
      "saghen/blink.cmp",
      dependencies = { "rafamadriz/friendly-snippets" },
      version = "1.*",
      opts = {
        keymap = { preset = "default" },
        appearance = {
          nerd_font_variant = "mono",
        },
        completion = { documentation = { auto_show = false } },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
      },
      opts_extend = { "sources.default" },
    },

    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "c",
            "lua",
            "markdown",
            "markdown_inline",
            "query",
            "vim",
            "vimdoc",
          },
          sync_install = false,
          auto_install = true,
          ignore_install = {},
          highlight = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = { "ruby" },
          },
          indent = {
            enable = true,
            disable = { "ruby" },
          },
        })
      end,
    },

    {
      "ibhagwan/fzf-lua",
      keys = {
        {
          "<Leader>ff",
          function()
            require("fzf-lua").files()
          end,
          desc = "fzf files",
        },
        {
          "<Leader>fg",
          function()
            require("fzf-lua").live_grep()
          end,
          desc = "fzf live grep",
        },
        {
          "<Leader>fb",
          function()
            require("fzf-lua").buffers()
          end,
          desc = "fzf buffers",
        },
        {
          "<Leader>fh",
          function()
            require("fzf-lua").help_tags()
          end,
          desc = "fzf help tags",
        },
      },
      opts = {},
    },
  },
  install = { colorscheme = { "gruvbox" } },
  checker = { enabled = true },
})
