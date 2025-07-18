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
vim.o.sidescrolloff = 2

-- Set tabstop options
vim.o.tabstop = 8
vim.o.softtabstop = -1
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Set line wrap options
vim.o.linebreak = true
vim.o.breakindent = true

-- Set search options
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set window split options
vim.o.splitright = true
vim.o.splitbelow = true

-- Save undo history
vim.o.undofile = true

-- Autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("text_yank_post", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
  desc = "Briefly highlight yanked text",
})

-- Plugins
require("config.lazy")
