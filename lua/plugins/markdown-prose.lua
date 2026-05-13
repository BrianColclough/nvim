-- Prose-friendly defaults for markdown / quarto buffers.
--
-- Not actually a plugin — just a lazy.nvim spec used as a convenient hook to
-- register a FileType autocmd at startup, keeping the file-per-feature
-- convention used elsewhere in lua/plugins/.

return {
    "folke/lazy.nvim", -- harmless self-reference; this spec just runs init().
    lazy = false,
    init = function()
        local group = vim.api.nvim_create_augroup("markdown-prose", { clear = true })

        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = { "markdown", "quarto" },
            desc = "Prose defaults: wrap, spell, conceal for markdown buffers",
            callback = function(args)
                local bo = vim.bo[args.buf]
                local wo = vim.wo

                -- Soft wrap at word boundaries.
                wo.wrap = true
                wo.linebreak = true
                wo.breakindent = true

                -- Spell check.
                wo.spell = true
                bo.spelllang = "en_us"

                -- Conceal markup (e.g. wikilinks, bold) but show raw text on
                -- the line under the cursor so editing isn't confusing.
                wo.conceallevel = 2
                wo.concealcursor = ""

                -- Drop the 120-column ruler for prose.
                wo.colorcolumn = ""

                -- Cursor moves visually through wrapped lines.
                local map = function(lhs, rhs, desc)
                    vim.keymap.set({ "n", "v" }, lhs, rhs, {
                        buffer = args.buf,
                        silent = true,
                        desc = desc,
                    })
                end
                map("j", "gj", "Move down (visual line)")
                map("k", "gk", "Move up (visual line)")
                map("0", "g0", "Start of visual line")
                map("$", "g$", "End of visual line")
            end,
        })
    end,
}
