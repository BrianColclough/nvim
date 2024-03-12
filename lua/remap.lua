local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local set = vim.opt

vim.g.mapleader = " "

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

set.swapfile = false
set.backup = false

set.hlsearch = false
set.incsearch = true

set.scrolloff = 8
set.termguicolors = true
set.cursorline = true
set.clipboard = "unnamedplus"

set.colorcolumn = "120"

map("i", "jk", "<Esc>", opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>E", ":NvimTreeFindFileToggle<CR>", opts)
map("n", "<leader>m", ":NvimTreeFocus<CR>", opts)

-- window movement
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>l", "<C-w>l", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>j", "<C-w>j", opts)

map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)

-- terminal mappings
if(vim.fn.has('macunix')) then
    map("n", "<leader>vt", ":80vsplit term://zsh<CR>", opts) -- for Mac
    map("n", "<leader>t", ":terminal zsh<CR>", opts) -- for Mac
else
    map("n", "<leader>vt", ":80vsplit term://powershell<CR>", opts) -- for Windows
    map("n", "<leader>t", ":terminal powershell.exe<CR>", opts) -- for Windows
end

map("t", "<C-j>", "<C-\\><C-n>", opts)

-- -- mappings for autofomat
map("n", "<leader>p", ":Neoformat<CR>", opts)
