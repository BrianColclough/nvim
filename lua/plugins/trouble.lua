return {
    {
        "folke/trouble.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
        keys = {
            { "[x",          function() require("trouble").prev({ skip_groups = true, jump = true }) end,                 desc = "Trouble: previous item" },
            { "]x",          function() require("trouble").next({ skip_groups = true, jump = true }) end,                 desc = "Trouble: next item" },
            { "<leader>xx",  function() require("trouble").toggle() end,                                     desc = "Trouble: toggle" },
            { "<leader>xw",  function() require("trouble").toggle({ mode = "diagnostics" }) end,                          desc = "Trouble: workspace diagnostics" },
            { "<leader>xd",  function() require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } }) end,    desc = "Trouble: document diagnostics" },
            { "<leader>xq",  function() require("trouble").toggle({ mode = "qflist" }) end,                               desc = "Trouble: quickfix" },
            { "<leader>xl",  function() require("trouble").toggle({ mode = "loclist" }) end,                              desc = "Trouble: location list" },
            { "gR",          function() require("trouble").toggle({ mode = "lsp_references" }) end,                       desc = "Trouble: LSP references" },
        },
    },
}
