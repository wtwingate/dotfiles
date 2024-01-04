-- NEOVIM OPTIONS

-- Enable line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable cursor line
vim.o.cursorline = true

-- Set scroll off
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Set tabs and indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

-- Enable search highlighting
vim.o.hlsearch = true

-- Set search behavior
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Save undo history
vim.o.undofile = true

-- Use 24-bit terminal colors
vim.o.termguicolors = true

-- Set default color scheme
vim.cmd.colorscheme("catppuccin")
