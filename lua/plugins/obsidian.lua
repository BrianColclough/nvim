-- Obsidian vault integration.
--
-- Uses the maintained community fork (obsidian-nvim/obsidian.nvim) since the
-- original epwalsh/obsidian.nvim was archived. The API is the same.
--
-- The vault lives on Google Drive (CloudStorage). Obsidian-specific behavior
-- (wikilink completion, backlinks, daily notes) only fires for buffers inside
-- that path; plain markdown elsewhere stays untouched.

local vault_path = vim.fn.expand(
    "/Users/briancolclough/Library/CloudStorage/GoogleDrive-brianmcolclough@gmail.com/My Drive/Brian's Vault"
)

return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    event = {
        "BufReadPre " .. vault_path .. "/**.md",
        "BufNewFile " .. vault_path .. "/**.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "brian",
                path = vault_path,
            },
        },

        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },

        daily_notes = {
            folder = "daily",
            date_format = "%Y-%m-%d",
        },

        -- Obsidian app already manages frontmatter; don't fight it.
        disable_frontmatter = true,

        -- Let render-markdown.nvim own in-buffer rendering so the two plugins
        -- don't both try to set conceal/highlights.
        ui = { enable = false },

        picker = {
            name = "telescope.nvim",
        },

        -- Open external links / images via macOS `open`.
        follow_url_func = function(url)
            vim.fn.jobstart({ "open", url })
        end,
        follow_img_func = function(img)
            vim.fn.jobstart({ "open", img })
        end,
    },
    keys = {
        { "<leader>nn", "<cmd>ObsidianNew<CR>",          desc = "Notes: new note",                    ft = "markdown" },
        { "<leader>nf", "<cmd>ObsidianQuickSwitch<CR>",  desc = "Notes: find note",                   ft = "markdown" },
        { "<leader>ng", "<cmd>ObsidianSearch<CR>",       desc = "Notes: grep notes",                  ft = "markdown" },
        { "<leader>nt", "<cmd>ObsidianToday<CR>",        desc = "Notes: today's daily",               ft = "markdown" },
        { "<leader>ny", "<cmd>ObsidianYesterday<CR>",    desc = "Notes: yesterday's daily",           ft = "markdown" },
        { "<leader>nl", "<cmd>ObsidianFollowLink<CR>",   desc = "Notes: follow link under cursor",    ft = "markdown" },
        { "<leader>nb", "<cmd>ObsidianBacklinks<CR>",    desc = "Notes: show backlinks",              ft = "markdown" },
        { "<leader>no", "<cmd>ObsidianOpen<CR>",         desc = "Notes: open in Obsidian app",        ft = "markdown" },
        { "<leader>nT", "<cmd>ObsidianTemplate<CR>",     desc = "Notes: insert template",             ft = "markdown" },
        { "<leader>nL", ":ObsidianLink<CR>",             desc = "Notes: wrap selection in wikilink", mode = "v",       ft = "markdown" },
    },
}
