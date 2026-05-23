return {
    "benlubas/molten-nvim",
    lazy = false,
    build = ":UpdateRemotePlugins",
    dependencies = { "3rd/image.nvim" },
    init = function()
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_output_win_max_height = 20
        vim.g.molten_auto_open_output = true
        vim.g.molten_virt_text_output = true
        vim.g.molten_virt_lines_off_by_1 = true
        vim.g.molten_wrap_output = true
        vim.g.molten_save_path = vim.fn.stdpath("data") .. "/molten"
    end,
    config = function()
        vim.api.nvim_create_autocmd("BufReadPost", {
            pattern = "*.ipynb",
            callback = function(ev)
                vim.schedule(function()
                    if vim.bo[ev.buf].filetype == "markdown" then
                        vim.cmd("MoltenInit python3")
                    end
                end)
            end,
            desc = "Auto-init molten python3 kernel for notebooks",
        })
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
        { "<leader>mS", ":MoltenSave<CR>",                    desc = "Molten: save outputs to disk" },
        { "<leader>mL", ":MoltenLoad<CR>",                    desc = "Molten: load outputs from disk" },
    },
}
