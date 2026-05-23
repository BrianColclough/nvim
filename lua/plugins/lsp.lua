return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = function(desc) return { buffer = ev.buf, desc = desc } end

                vim.keymap.set("n", "gD",          vim.lsp.buf.declaration,                              opts("LSP: go to declaration"))
                vim.keymap.set("n", "gd",          vim.lsp.buf.definition,                               opts("LSP: go to definition"))
                vim.keymap.set("n", "K",           vim.lsp.buf.hover,                                    opts("LSP: hover"))
                vim.keymap.set("n", "gi",          vim.lsp.buf.implementation,                           opts("LSP: go to implementation"))
                vim.keymap.set("n", "<C-k>",       vim.lsp.buf.signature_help,                           opts("LSP: signature help"))
                vim.keymap.set("n", "<leader>wa",  vim.lsp.buf.add_workspace_folder,                     opts("LSP: workspace add folder"))
                vim.keymap.set("n", "<leader>wr",  vim.lsp.buf.remove_workspace_folder,                  opts("LSP: workspace remove folder"))
                vim.keymap.set("n", "<leader>wl",  function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts("LSP: workspace list folders"))
                vim.keymap.set("n", "<leader>D",   vim.lsp.buf.type_definition,                          opts("LSP: type definition"))
                vim.keymap.set("n", "<leader>rn",  vim.lsp.buf.rename,                                   opts("LSP: rename"))
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,                      opts("LSP: code action"))
                vim.keymap.set("n", "gr",          vim.lsp.buf.references,                               opts("LSP: references"))
                vim.keymap.set("n", "<leader>f",   function() vim.lsp.buf.format({ async = true }) end,  opts("LSP: format buffer"))
                vim.keymap.set("n", "[d",          function() vim.diagnostic.goto_prev() end,            opts("LSP: prev diagnostic"))
                vim.keymap.set("n", "]d",          function() vim.diagnostic.goto_next() end,            opts("LSP: next diagnostic"))
            end,
        })
    end,
}
