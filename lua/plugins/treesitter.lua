return {
    "nvim-treesitter/nvim-treesitter",
    cmd = "TSUpdate",
    config = function()
        local configs = require("nvim-treesitter")

        configs.setup({
            -- A list of parser names, or "all"
            ensure_installed = { 'typescript', 'html', 'javascript', 'angular', 'json', 'json5', 'rust', 'css', 'scss', 'java' },

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
