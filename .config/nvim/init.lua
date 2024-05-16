--
--                             ________ ++     ________
--                            /VVVVVVVV\++++  /VVVVVVVV\
--                            \VVVVVVVV/++++++\VVVVVVVV/
--                             |VVVVVV|++++++++/VVVVV/'
--                             |VVVVVV|++++++/VVVVV/'
--                            +|VVVVVV|++++/VVVVV/'+
--                          +++|VVVVVV|++/VVVVV/'+++++
--                        +++++|VVVVVV|/VVVVV/'+++++++++
--                          +++|VVVVVVVVVVV/'+++++++++
--                            +|VVVVVVVVV/'+++++++++
--                             |VVVVVVV/'+++++++++
--                             |VVVVV/'+++++++++
--                             |VVV/'+++++++++
--                             'V/'   ++++++
--                                      ++
--

-- Set <Space> as the <Leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Neovim Options ]]

-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set cursor options
vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4

-- Disable line wrapping
vim.opt.wrap = false

-- Enable search highlighting
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Set search options
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Save undo history
vim.opt.undofile = true

-- [[ Neovim Keymaps ]]

-- Clear search highlighting
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

-- Navigate between split windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to top window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })

-- [[ Neovim Autocommands ]]

-- Create autocommand group
local vimrc = vim.api.nvim_create_augroup("vimrc", { clear = true })

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Briefly highlight yanked text",
	group = vimrc,
	callback = function()
		vim.highlight.on_yank()
	end,
})
