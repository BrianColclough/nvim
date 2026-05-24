return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                preview = { treesitter = false },
            },
        })

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files,   { desc = "Telescope: find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep,    { desc = "Telescope: live grep" })
        vim.keymap.set("n", "<leader>fG", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Telescope: grep with prompt" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers,      { desc = "Telescope: buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags,    { desc = "Telescope: help tags" })
        vim.keymap.set("n", "<leader>fl", function()
            builtin.current_buffer_fuzzy_find()
        end, { desc = "Telescope: fuzzy find in buffer" })
        vim.keymap.set("n", "<leader>fp", function()
            builtin.resume()
        end, { desc = "Telescope: resume last picker" })

        vim.keymap.set("n", "<leader>sw", function()
            builtin.grep_string({ search = vim.fn.expand("<cword>") })
        end, { desc = "Search: grep word under cursor" })
        vim.keymap.set("n", "<leader>sW", function()
            builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
        end, { desc = "Search: grep WORD under cursor" })

        -- LSP bindings
        vim.keymap.set("n", "<leader>fr", builtin.lsp_references,     { desc = "Telescope: LSP references" })
        vim.keymap.set("n", "<leader>fi", builtin.lsp_incoming_calls,  { desc = "Telescope: LSP incoming calls" })
        vim.keymap.set("n", "<leader>fo", builtin.lsp_outgoing_calls,  { desc = "Telescope: LSP outgoing calls" })

        -- Git bindings
        vim.keymap.set("n", "<leader>fc", builtin.git_commits,  { desc = "Telescope: git commits" })
        vim.keymap.set("n", "<C-p>",      builtin.git_files,    { desc = "Telescope: git files" })
        vim.keymap.set("n", "<leader>fs", builtin.git_status,   { desc = "Telescope: git status" })
        vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope: git branches" })
    end,
}
