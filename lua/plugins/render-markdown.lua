return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "quarto" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        -- Show raw markdown on the current line so editing stays easy.
        anti_conceal = { enabled = true },
        -- Heading styling: full-width background with icons.
        heading = {
            sign = false,
            width = "block",
        },
        -- Render fenced code blocks with a subtle border.
        code = {
            sign = false,
            width = "block",
            border = "thin",
        },
        -- GitHub-style task list checkboxes.
        checkbox = {
            enabled = true,
            position = "inline",
        },
    },
    keys = {
        {
            "<leader>nr",
            "<cmd>RenderMarkdown toggle<CR>",
            ft = { "markdown", "quarto" },
            desc = "Markdown: toggle pretty render",
        },
    },
}
