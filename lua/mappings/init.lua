local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("i", "jk", "<Esc>", opts)

-- window movement
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>l", "<C-w>l", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>j", "<C-w>j", opts)

map("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })

map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true, silent = true })
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true, silent = true })
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true, silent = true })
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true, silent = true })

-- mappings for autofomat
map("n", "<leader>p", ":Neoformat<CR>", opts)
