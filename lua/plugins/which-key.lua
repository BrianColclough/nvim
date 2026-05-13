return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 300,
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.add({
            { "<leader>f",  group = "find / telescope" },
            { "<leader>h",  group = "git hunks" },
            { "<leader>x",  group = "trouble / diagnostics" },
            { "<leader>m",  group = "molten / harpoon" },
            { "<leader>c",  group = "code / copilot" },
            { "<leader>cc", group = "copilot chat" },
            { "<leader>t",  group = "tabs" },
            { "<leader>z",  group = "zen-mode" },
            { "<leader>g",  group = "git" },
            { "<leader>s",  group = "search word" },
            { "<leader>n",  group = "notes / markdown" },
        })
    end,
}
