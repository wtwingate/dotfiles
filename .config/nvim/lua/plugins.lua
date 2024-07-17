return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local language_servers = {
                "astro",
                "clangd",
                "cssls",
                "emmet_language_server",
                "html",
                "lua_ls",
                "pyright",
                "ruff_lsp",
                "tailwindcss",
                "tsserver",
            }

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = language_servers,
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            for _, server in ipairs(language_servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                })
            end

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        completion = { callSnippet = "Replace" },
                        diagnostics = { disable = { "missing-fields" } },
                        workspace = { library = { vim.env.VIMRUNTIME } },
                    },
                },
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
                css = { "prettier" },
                html = { "prettier" },
                javascript = { "prettier" },
                lua = { "stylua" },
                markdown = { "prettier" },
                typescript = { "prettier" },
            },
            format_on_save = function(bufnr)
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
        },
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
        "echasnovski/mini.nvim",
        version = false,
        config = function()
            require("mini.ai").setup()
            require("mini.comment").setup()
            require("mini.surround").setup()
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("gruvbox")
        end,
    },

    "tpope/vim-fugitive",
}

-- vim: ts=4 sts=4 sw=4 et
