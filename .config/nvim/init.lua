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

-- [[ Options ]]

-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set cursor options
vim.opt.cursorline = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 4

-- Set line wrap options
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Set search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preview substitutions
vim.opt.inccommand = "split"

-- Save undo history
vim.opt.undofile = true

-- [[ Keymaps ]]

vim.keymap.set("n", "-", "<Cmd>Explore<CR>", { desc = "Explore parent directory" })
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

-- [[ Autocommands ]]

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Briefly highlight yanked text",
    group = vim.api.nvim_create_augroup("YankAugroup", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- [[ Plugins ]]

-- Install and bootstrap plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Install and configure plugins
require("lazy").setup("plugins")

-- vim: ts=4 sts=4 sw=4 et
