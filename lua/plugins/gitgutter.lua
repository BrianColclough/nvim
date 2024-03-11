return {
    "airblade/vim-gitgutter",
    config = function()
        local map = vim.api.nvim_set_keymap
        map("n", "<leader>ggd", ":GitGutterDiffOrig<CR>", { noremap = true, silent = true })
        map("n", "<leader>ggf", ":GitGutterFold<CR>", { noremap = true, silent = true })
    end,
}
