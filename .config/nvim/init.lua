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

-- Save backup files
local statedir = vim.fn.stdpath("state")
vim.o.backup = true
vim.o.backupdir = statedir .. "/backup//"

-- Save undo history
vim.o.undofile = true
vim.o.undodir = statedir .. "/undo//"

-- Create autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("my.vimrc", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
  desc = "Briefly highlight yanked text",
})

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Define keymaps
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })
vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })
vim.keymap.set({ "n", "v" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })
vim.keymap.set({ "n", "v" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })

-- Add packages
vim.pack.add({
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  {
    src = "https://github.com/Saghen/blink.cmp",
    version = "v1.7.0",
  },
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/tpope/vim-sleuth",
})

-- Set up LSP servers
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd",
    "emmet_language_server",
    "herb_ls",
    "lua_ls",
    "pyright",
    "ruby_lsp",
    "vtsls",
  },
})

-- Configure LSP client
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
  callback = function()
    vim.keymap.set("n", "grd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
    vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
  end,
})

-- Set up nvim-treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "ruby",
    "vim",
    "vimdoc",
    "yaml",
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },
})

-- Set up mini.nvim
require("mini.ai").setup()
require("mini.icons").setup()
require("mini.surround").setup()

-- Set up blink.cmp
require("blink.cmp").setup({
  keymap = { preset = "default" },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = { documentation = { auto_show = false } },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

-- Set up conform.nvim
require("conform").setup({
  formatters_by_ft = {
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    lua = { "stylua" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

-- Set up oil.nvim
require("oil").setup({
  columns = { "icon", "permissions", "size", "mtime" },
})

vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })

-- Set up fzf-lua
local fzf = require("fzf-lua")
vim.keymap.set("n", "<Leader>ff", fzf.files, { desc = "fzf files" })
vim.keymap.set("n", "<Leader>fb", fzf.buffers, { desc = "fzf buffers" })
vim.keymap.set("n", "<Leader>fg", fzf.live_grep, { desc = "fzf live grep" })
vim.keymap.set("n", "<Leader>fh", fzf.help_tags, { desc = "fzf help tags" })
vim.keymap.set("n", "<Leader>fp", fzf.global, { desc = "fzf global" })

-- Set color scheme
vim.cmd.colorscheme("gruvbox")
