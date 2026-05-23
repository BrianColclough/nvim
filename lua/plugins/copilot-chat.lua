local prompts = {
    Review = "Please review the following code and provide suggestions for improvement.",
    Refactor = "Please refactor the following code to improve its clarity and readability.",
    BetterNamings = "Please provide better names for the following variables and functions.",
}

return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    event = "VeryLazy",
    dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim" },
    },
    opts = {
        show_help = "yes",
        debug = false,
        prompts = prompts,
        disable_extra_info = "no",
        hide_system_prompt = "yes",
    },
    keys = {
        { "<leader>cc",  "<cmd>CopilotChatOpen<CR>",           desc = "CopilotChat: open chat" },
        { "<leader>ccm", "<cmd>CopilotChatCommitStaged<CR>",   desc = "CopilotChat: generate commit message" },
        { "<leader>cct", "<cmd>CopilotChatTests<CR>",          desc = "CopilotChat: generate tests" },
        { "<leader>cce", "<cmd>CopilotChatExplain<CR>",        desc = "CopilotChat: explain code",         mode = { "v", "n" } },
        { "<leader>ccr", "<cmd>CopilotChatReview<CR>",         desc = "CopilotChat: review code",          mode = { "v", "n" } },
        { "<leader>ccR", "<cmd>CopilotChatRefactor<CR>",       desc = "CopilotChat: refactor code",        mode = { "v", "n" } },
        { "<leader>ccn", "<cmd>CopilotChatBetterNamings<CR>",  desc = "CopilotChat: better naming",        mode = { "v", "n" } },
        { "<leader>ccd", "<cmd>CopilotChatDocumentation<CR>",  desc = "CopilotChat: documentation",        mode = { "v", "n" } },
        { "<leader>ccf", "<cmd>CopilotChatFixCode<CR>",        desc = "CopilotChat: fix code",             mode = { "v", "n" } },
        { "<leader>ccF", "<cmd>CopilotChatFixDiagnostic<CR>",  desc = "CopilotChat: fix diagnostic",       mode = { "v", "n" } },
    },
}
