require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "css", "go", "graphql", "html", "java", "javascript",
                        "jsdoc", "json", "json5", "lua", "markdown", "markdown_inline", "python",
                        "rust", "sql", "tsx", "typescript", "vim", "vue" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}
