-- NEOVIM KEYMAPS

-- Set <Space> as the <Leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove default keymaps for <Space>
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
