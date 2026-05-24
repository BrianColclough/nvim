return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = function()
        require("nvim-treesitter").install({
            "typescript", "html", "javascript", "angular",
            "json", "json5", "rust", "css", "scss",
            "python", "markdown", "markdown_inline",
            "lua", "vim", "vimdoc",
        })
    end,
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
