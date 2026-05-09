local set = vim.opt

vim.g.mapleader = " "
vim.g.copilot_no_tab_map = true


set.number = true
set.rnu = true

set.updatetime = 50
set.expandtab = true
set.smarttab = true
set.smartindent = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4

set.wrap = false

set.splitbelow = true
set.splitright = true

set.swapfile = false
set.backup = false

set.hlsearch = false
set.incsearch = true

set.scrolloff = 12
set.termguicolors = true
set.cursorline = true
set.clipboard = "unnamedplus"

set.colorcolumn = "120"

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- move highlighted code up and down lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- keep cursor in the same location when joining lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })

-- use leader P to paste over visual selection and not lose the contents of the register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection (keep register)" })

-- ensure cursor is always in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half-page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half-page up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })
vim.keymap.set("n", "*", "*zzzv", { desc = "Search word under cursor (centered)" })

-- window movement
vim.keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, silent = true, desc = "Window: move left" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, silent = true, desc = "Window: move right" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, silent = true, desc = "Window: move up" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, silent = true, desc = "Window: move down" })

vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save" })

-- escape from terminal-mode (used when :terminal is opened manually)
vim.keymap.set("t", "<C-j>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Exit terminal mode" })
