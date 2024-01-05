return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({})
		require("neodev").setup({})

		-- Add additional capabilities with nvim-cmp
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Set up language servers
		local lspconfig = require("lspconfig")
		local servers = {
			"clangd",
			"cssls",
			"emmet_language_server",
			"html",
			"lua_ls",
			"pyright",
			"solargraph",
			"tsserver",
		}
		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						disable = { "missing-fields" },
					},
				},
			},
		})

		-- Global mappings
		vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)

		-- Local mappings
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- NOTE: omnifunc must be disabled when using nvim-cmp
				-- vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

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
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})
	end,
}
