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

-- Configure split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions
vim.opt.inccommand = "split"

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

-- Open parent directory
vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory" })

-- [[ Neovim Autocommands ]]

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Briefly highlight yanked text",
	group = vim.api.nvim_create_augroup("YankAugroup", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- [[ Neovim Plugins ]]

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
require("lazy").setup({

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "folke/neodev.nvim", opts = {} },
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						diagnostics = { disable = { "missing-fields" } },
					},
				},
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "Set local keymaps when LSP attaches to buffer",
				group = vim.api.nvim_create_augroup("LspAugroup", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("gd", require("telescope.builtin").lsp_definitions, "Go to Definition")
					map("gt", require("telescope.builtin").lsp_type_definitions, "Go to Type Definition")
					map("gi", require("telescope.builtin").lsp_implementations, "Go to Implementations")
					map("gr", require("telescope.builtin").lsp_references, "Go to References")
					map("<Leader>rn", vim.lsp.buf.rename, "Rename Symbol")
					map("<Leader>ca", vim.lsp.buf.code_action, "Code Action")
				end,
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
			},
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
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
					additional_vim_regex_highlighting = false,
				},

				indent = {
					enable = true,
					disable = {},
				},
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				go = { "goimports" },
				javascript = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
			},
			format_on_save = function(bufnr)
				local disable_ft = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_ft[vim.bo[bufnr].filetype],
				}
			end,
		},
	},

	{
		"stevearc/oil.nvim",
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			require("telescope").setup({})
			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<Leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<Leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<Leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<Leader>fh", builtin.help_tags, {})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		-- dependencies = { "nvim-tree/nvim-web-devicons" }
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					component_separators = "|",
					section_separators = "",
				},
			})
		end,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	"tpope/vim-fugitive",
})

-- Configured with love by William Wingate
-- vim: ts=4 sts=4 sw=4 noet
