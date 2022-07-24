local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('i', 'jk', '<Esc>', opts)

-- window movement
map('n', '<leader>h', '<C-w>h', opts)
map('n', '<leader>l', '<C-w>l', opts)
map('n', '<leader>k', '<C-w>k', opts)
map('n', '<leader>j', '<C-w>j', opts)
