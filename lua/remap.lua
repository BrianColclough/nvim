local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

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

map("i", "jk", "<Esc>", opts)

-- move highlighted code up and down lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in the same location when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- user leader P to paste over visual selection and not lose the contents of the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- ensure cursor is always in the middle of the screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- window movement
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>l", "<C-w>l", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>j", "<C-w>j", opts)

map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>w", ":w<CR>", opts)

-- terminal mappings
if vim.fn.has("win32") or vim.fn.has("win64") then
    map("n", "<leader>vt", ":80vsplit term://powershell<CR>", opts) -- for Windows
    map("n", "<leader>t", ":terminal powershell.exe<CR>", opts)     -- for Windows
end

if vim.fn.has("macunix") then
    map("n", "<leader>vt", ":80vsplit term://zsh<CR>", opts) -- for Mac
    map("n", "<leader>t", ":terminal zsh<CR>", opts)         -- for Mac
end

map("t", "<C-j>", "<C-\\><C-n>", opts)

-- mappings for autofomat
map("n", "<leader>F", ":Neoformat<CR>", opts)
