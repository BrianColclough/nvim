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

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("i", "jk", "<Esc>", opts)

-- window movement
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>l", "<C-w>l", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>j", "<C-w>j", opts)

map("n", "<leader>q", ":q<CR>", opts)

-- mappings for autofomat
map("n", "<leader>p", ":Neoformat<CR>", opts)

require("lazy").setup("plugins")
