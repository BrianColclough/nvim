local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local set = vim.opt

vim.g.mapleader = " "

set.updatetime = 100
set.expandtab = true
set.smarttab = true
set.number = true
set.rnu = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = "utf-8"
set.termguicolors = true
set.cursorline = true
set.clipboard = "unnamedplus"

set.syntax = "on"
set.completeopt = { "menu", "menuone", "noselect" }

map("i", "jk", "<Esc>", opts)

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
-- map("n", "<leader>vt", ":80vsplit term://zsh<CR>", opts) -- for Mac
-- map("n", "<leader>t", ":terminal zsh<CR>", opts) -- for Mac
map("n", "<leader>vt", ":80vsplit term://powershell<CR>", opts) -- for Windows
map("n", "<leader>t", ":terminal powershell.exe<CR>", opts) -- for Windows

map("t", "<C-j>", "<C-\\><C-n>", opts)

-- mappings for autofomat
map("n", "<leader>p", ":Neoformat<CR>", opts)

require("lazy").setup("plugins")
