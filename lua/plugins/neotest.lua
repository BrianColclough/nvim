return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python",
    },
    keys = {
        { "<leader>dtr", function() require("neotest").run.run() end,                       desc = "Test: run nearest" },
        { "<leader>dtf", function() require("neotest").run.run(vim.fn.expand("%")) end,     desc = "Test: run file" },
        { "<leader>dts", function() require("neotest").summary.toggle() end,                desc = "Test: toggle summary" },
        { "<leader>dto", function() require("neotest").output_panel.toggle() end,           desc = "Test: toggle output panel" },
        { "<leader>dtx", function() require("neotest").run.stop() end,                     desc = "Test: stop" },
        { "[t",          function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Test: prev failed" },
        { "]t",          function() require("neotest").jump.next({ status = "failed" }) end, desc = "Test: next failed" },
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                    runner = "pytest",
                    python = function()
                        local ok, venv = pcall(function()
                            return require("venv-selector").python()
                        end)
                        return (ok and venv) or "python3"
                    end,
                }),
            },
            output = { open_on_run = true },
            status = { enabled = true, signs = true, virtual_text = false },
        })
    end,
}
