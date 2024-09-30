return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { },
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		-- no popup until search
		vim.keymap.set("n", "<leader>fG", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>sw", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>sW", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)

		vim.keymap.set("n", "<leader>fl", function()
			builtin.current_buffer_fuzzy_find()
		end)

		vim.keymap.set("n", "<leader>fp", function()
			builtin.resume()
		end)

		-- LSP bindings
		vim.keymap.set("n", "<leader>fr", function()
			builtin.lsp_references()
		end)
		vim.keymap.set("n", "<leader>fi", function()
			builtin.lsp_incoming_calls()
		end)
		vim.keymap.set("n", "<leader>fo", function()
			builtin.lsp_outgoing_calls()
		end)

		-- Git bindings
		vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		vim.keymap.set("n", "<leader>fs", builtin.git_status, {})
		vim.keymap.set("n", "<leader>m", builtin.git_branches, {})
	end,
}
