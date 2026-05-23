return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Harpoon: add file" })

        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon: toggle quick menu" })

        vim.keymap.set("n", "<leader>ma", function() harpoon:list():select(1) end, { desc = "Harpoon: jump to slot 1" })
        vim.keymap.set("n", "<leader>ms", function() harpoon:list():select(2) end, { desc = "Harpoon: jump to slot 2" })
        vim.keymap.set("n", "<leader>md", function() harpoon:list():select(3) end, { desc = "Harpoon: jump to slot 3" })
        vim.keymap.set("n", "<leader>mf", function() harpoon:list():select(4) end, { desc = "Harpoon: jump to slot 4" })

        vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: previous entry" })
        vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: next entry" })
    end,
}
