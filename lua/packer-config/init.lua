return require'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'    
    use "EdenEast/nightfox.nvim"

    -- lsp and autocomplete
    use 'neovim/nvim-lspconfig' -- lsp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use "rafamadriz/friendly-snippets"
    
    use 'jxnblk/vim-mdx-js'

    -- indentation lines
    use "lukas-reineke/indent-blankline.nvim"

    -- Comment out multiple lines as once
    use {
    'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    
    use 'nvim-treesitter/nvim-treesitter'
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
    
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-lua/plenary.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use 'tpope/vim-fugitive'
end)
