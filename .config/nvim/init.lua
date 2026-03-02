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
vim.o.colorcolumn = "80,120"

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

-- Manage plugins
require("config.lazy")

-- Set color scheme
vim.cmd.colorscheme("gruvbox")
