return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>ma", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>ms", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>md", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>mf", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		--
		vim.keymap.set("n", "<leader>mn", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<header>mn", function()
			harpoon:list():next()
		end)
	end,
}