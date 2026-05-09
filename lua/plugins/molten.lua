return {
    "benlubas/molten-nvim",
    -- remote plugins must not be lazy-loaded or :UpdateRemotePlugins won't find them
    lazy = false,
    build = ":UpdateRemotePlugins",
    dependencies = { "3rd/image.nvim" },
    init = function()
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_output_win_max_height = 20
        vim.g.molten_auto_open_output = false
        vim.g.molten_virt_text_output = true
        vim.g.molten_virt_lines_off_by_1 = true
        vim.g.molten_wrap_output = true
    end,
    keys = {
        { "<leader>mi", ":MoltenInit<CR>",                    desc = "Molten: init kernel" },
        { "<leader>me", ":MoltenEvaluateOperator<CR>",        desc = "Molten: evaluate operator" },
        { "<leader>ml", ":MoltenEvaluateLine<CR>",            desc = "Molten: evaluate line" },
        { "<leader>mc", ":MoltenReevaluateCell<CR>",          desc = "Molten: re-evaluate cell" },
        { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv",   mode = "v", desc = "Molten: evaluate visual" },
        { "<leader>mo", ":noautocmd MoltenEnterOutput<CR>",   desc = "Molten: enter output window" },
        { "<leader>mh", ":MoltenHideOutput<CR>",              desc = "Molten: hide output" },
        { "<leader>mq", ":MoltenDelete<CR>",                  desc = "Molten: delete cell" },
    },
}
