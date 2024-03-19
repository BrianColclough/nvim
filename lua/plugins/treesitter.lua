return {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    lazy = false,
    cmd = "TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {'astro', 'typescript', 'css', 'rust', 'angular', 'html'},
 
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            highlight = {
                enable = true,
            },

            indent = {
                enable = true,
            },
        })
    end,
}
