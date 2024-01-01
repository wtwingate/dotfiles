-- Set <Space> as the <Leader> key
-- NOTE: This needs to happen before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ PLUGIN MANAGER ]] --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- [[ DOWNLOAD PLUGINS ]] --

require("lazy").setup({

	-- Essential tpope plugins
	"tpope/vim-fugitive",
	"tpope/vim-surround",

	-- Language Servers
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim"
		}
	},

	-- Language Parsers
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},

	-- Fuzzy Finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make"
			},
		}
	},

	-- Color Scheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {}
	}
})

-- [[ NEOVIM OPTIONS ]] --

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

-- [[ NEOVIM KEYMAPS ]] --

-- Remove default keymaps for <Space>
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- [[ LSPCONFIG ]] --

-- Download language servers
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"lua_ls",
		"pyright",
		"tsserver",
	}
})
require("neodev").setup({})

-- Set up language servers
local lspconfig = require("lspconfig")
lspconfig.clangd.setup({})
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				disable = { "missing-fields" }
			}
		}
	}
})
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})

-- Global mappings
vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)

-- Local mappings
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <C-X><C-O>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-K>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<Leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<Leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<Leader>f", function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

-- [[ TREESITTER ]] --

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"css",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"typescript",
		"vim",
		"vimdoc",
		"query"
	},
	sync_install = false,
	auto_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
})

-- [[ TELESCOPE ]] --

require("telescope").setup({})
require("telescope").load_extension("fzf")

-- Set keymaps for picker functions
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
