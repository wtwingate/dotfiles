return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local language_servers = {
                "clangd",
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

            local lspconfig = require("lspconfig")

            for _, server in ipairs(language_servers) do
                lspconfig[server].setup({})
            end

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
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
