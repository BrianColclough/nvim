return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'    
    use "EdenEast/nightfox.nvim"
    use 'neovim/nvim-lspconfig' -- lsp
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
    }
    use {
        "max397574/better-escape.nvim",
      config = function()
        require("better_escape").setup{
            mapping = {"jk", "jj"},
            timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
        }
        end,
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)
