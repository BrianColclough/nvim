return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "nvim-neotest/nvim-nio",
        },
        keys = {
            { "<leader>db",  function() require("dap").toggle_breakpoint() end,                                          desc = "Debug: toggle breakpoint" },
            { "<leader>dB",  function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end,                 desc = "Debug: conditional breakpoint" },
            { "<leader>dc",  function() require("dap").continue() end,                                                   desc = "Debug: continue" },
            { "<leader>di",  function() require("dap").step_into() end,                                                  desc = "Debug: step into" },
            { "<leader>do",  function() require("dap").step_over() end,                                                  desc = "Debug: step over" },
            { "<leader>dO",  function() require("dap").step_out() end,                                                   desc = "Debug: step out" },
            { "<leader>dr",  function() require("dap").repl.open() end,                                                  desc = "Debug: open REPL" },
            { "<leader>dl",  function() require("dap").run_last() end,                                                   desc = "Debug: run last" },
            { "<leader>du",  function() require("dapui").toggle() end,                                                   desc = "Debug: toggle UI" },
            { "<leader>dq",  function() require("dap").terminate(); require("dapui").close() end,                        desc = "Debug: quit" },
            { "<leader>de",  function() require("dapui").eval(nil, { enter = true }) end, mode = { "n", "v" },           desc = "Debug: evaluate expression" },
            { "<leader>dtp", function() require("dap-python").test_method() end,                                         desc = "Debug: run test method under cursor" },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dap_python = require("dap-python")

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            local python_path = function()
                local venv_python = vim.fn.exepath("python")
                if venv_python ~= "" then
                    return venv_python
                end
                return vim.fn.exepath("python3")
            end

            dap_python.setup(python_path())

            dapui.setup({
                layouts = {
                    {
                        elements = {
                            { id = "scopes",      size = 0.4 },
                            { id = "breakpoints", size = 0.2 },
                            { id = "stacks",      size = 0.2 },
                            { id = "watches",     size = 0.2 },
                        },
                        position = "left",
                        size = 40,
                    },
                    {
                        elements = {
                            { id = "repl",    size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        position = "bottom",
                        size = 10,
                    },
                },
            })
        end,
    },
}
