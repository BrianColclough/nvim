
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#c94f6d gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#d67ad2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#dbc074 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#719cd6 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#9d79d6 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#63cdcf gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
