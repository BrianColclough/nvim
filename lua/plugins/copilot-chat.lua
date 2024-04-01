local prompts = {
	Review = "Please review the following code and provide suggestions for improvement.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	BetterNamings = "Please provide better names for the following variables and functions.",
}

return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	event = "VeryLazy",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	opts = {
		show_help = "yes",
		debug = false, -- Set to true to see the response from GitHub Copilot API. The log file will be in ~/.local/state/nvim/CopilotChat.nvim.log.
		prompts = prompts,
		disable_extra_info = "no", -- Disable extra information (e.g.: system prompt, token count) in the response.
		hide_system_prompt = "yes", -- Show user prompts only and hide system prompts.
	},
	keys = {
		{ "<leader>cc", "<cmd>CopilotChatOpen<CR>" },
		{
			"<leader>ccm",
			"<cmd>CopilotChatCommitStaged<CR>",
		},
		{
			"<leader>cco",
			"<cmd>CopilotChatOptimize<CR>",
		},
		{ "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
		{
			"<leader>cce",
			"<cmd>CopilotChatExplain<cr>",
			desc = "CopilotChat - Explain code",
			mode = { "v", "n" },
		},
		{
			"<leader>ccr",
			"<cmd>CopilotChatReview<cr>",
			desc = "CopilotChat - Review code",
			mode = { "v", "n" },
		},
		{
			"<leader>ccR",
			"<cmd>CopilotChatRefactor<cr>",
			desc = "CopilotChat - Refactor code",
			mode = { "v", "n" },
		},
		{
			"<leader>ccn",
			"<cmd>CopilotChatBetterNamings<cr>",
			desc = "CopilotChat - Better Naming",
			mode = { "v", "n" },
		},
		{
			"<leader>ccd",
			"<cmd>CopilotChatDocs<cr>",
			desc = "CopilotChat - Documentation",
			mode = { "v", "n" },
		},
		{ "<leader>ccf", "<cmd>CopilotChatFix<cr>", desc = "CopilotChat - Fix Code", mode = { "v", "n" } },
		{
			"<leader>ccF",
			"<cmd>CopilotChatFixDiagnostic<CR>",
			mode = { "v", "n" },
		},
	},
}
