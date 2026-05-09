return {
    "quarto-dev/quarto-nvim",
    ft = { "quarto", "markdown" },
    dependencies = {
        { "jmbuhr/otter.nvim", opts = {} },
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        codeRunner = {
            enabled = true,
            default_method = "molten",
        },
        lspFeatures = {
            enabled = true,
            languages = { "python" },
            chunks = "all",
            diagnostics = { enabled = true, triggers = { "BufWritePost" } },
            completion = { enabled = true },
        },
    },
}
