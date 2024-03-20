return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local opts = { noremap = true, silent = true }
        require("nvim-tree").setup({
            diagnostics = {
                enable = true,
            },
            filters = {
                dotfiles = true,
            },
            view = {
                width = 50,
            },

            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts),
            vim.keymap.set("n", "<leader>E", ":NvimTreeFindFileToggle<CR>", opts),
            vim.keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts)
        })
    end,
}
