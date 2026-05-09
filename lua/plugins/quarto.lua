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
    keys = {
        { "<leader>mA", function() require("quarto.runner").run_all() end,
            desc = "Quarto/Molten: run all cells" },
        { "<leader>mB", function() require("quarto.runner").run_below() end,
            desc = "Quarto/Molten: run cells below cursor" },
        { "<leader>mU", function() require("quarto.runner").run_above() end,
            desc = "Quarto/Molten: run cells above cursor" },
        { "<leader>mC", function() require("quarto.runner").run_cell() end,
            desc = "Quarto/Molten: run current cell" },
    },
}
