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
                "clojure_lsp",
                "lua_ls",
                "pyright",
                "ruff_lsp",
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
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                clojure = { "cljfmt" },
                css = { "prettier" },
                html = { "prettier" },
                javascript = { "prettier" },
                lua = { "stylua" },
                -- python = { "isort", "autopep8" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },

    {
        "stevearc/oil.nvim",
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "-", "<Cmd>Oil<CR>", desc = "Open parent directory" },
        },
        opts = {},
    },

    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("gruvbox")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        -- dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = false,
                    theme = "gruvbox",
                },
            })
        end,
    },

    {
        "Olical/conjure",
        ft = { "clojure" }, -- etc
        lazy = true,
        init = function()
            -- Set configuration options here
            -- vim.g["conjure#debug"] = true
        end,

        -- Optional cmp-conjure integration
        dependencies = { "PaterJason/cmp-conjure" },
    },

    {
        "PaterJason/cmp-conjure",
        lazy = true,
        config = function()
            local cmp = require("cmp")
            local config = cmp.get_config()
            table.insert(config.sources, { name = "conjure" })
            return cmp.setup(config)
        end,
    },

    "tpope/vim-fugitive",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "guns/vim-sexp",
    "tpope/vim-sexp-mappings-for-regular-people",
}

-- vim: ts=4 sts=4 sw=4 et
