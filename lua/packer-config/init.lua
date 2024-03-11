return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("EdenEast/nightfox.nvim")

	-- lsp and autocomplete
	use("neovim/nvim-lspconfig") -- lsp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use("jxnblk/vim-mdx-js")


	-- indentation lines

	-- Comment out multiple lines as once

	-- eslint
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/eslint.nvim")

	--git gutter
	use("airblade/vim-gitgutter")

	-- auto-pairs
	use("jiangmiao/auto-pairs")
	-- change surroundings
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	})
end)
