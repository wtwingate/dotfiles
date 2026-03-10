return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local parsers = {
      "bash",
      "c",
      "cpp",
      "css",
      "diff",
      "go",
      "html",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "ruby",
      "rust",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
    }
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf, filetype = args.buf, args.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if not lang then return end

        if vim.treesitter.language.add(lang) then
          vim.treesitter.start(buf, lang)
          -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
          -- vim.wo[0][0].foldmethod = "expr"
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
