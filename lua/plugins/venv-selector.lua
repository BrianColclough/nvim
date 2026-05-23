return {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    ft = "python",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        settings = {
            search = {
                venv_dirs = { ".venv", "venv", "env" },
                search_workspace = true,
            },
        },
    },
    keys = {
        { "<leader>cv", "<cmd>VenvSelect<CR>",        desc = "Python: select virtualenv" },
        { "<leader>cV", "<cmd>VenvSelectCached<CR>",  desc = "Python: use cached virtualenv" },
    },
}
