return {
    "hrsh7th/nvim-cmp",
    version = "*",
    lazy = false,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "eslint",
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "cssls",
                "jsonls",
                "tailwindcss",
                "angularls",
                "astro",
                "pyright",
                "ruff",
                "marksman",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["eslint"] = function()
                    local lspconfig = require("lspconfig")

                    lspconfig.eslint.setup({
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            vim.api.nvim_create_autocmd("BufWritePre", {
                                pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
                                command = "EslintFixAll",
                            })
                        end,
                    })
                end,

                ["pyright"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "standard",
                                    autoSearchPaths = true,
                                    useLibraryCodeForTypes = true,
                                    diagnosticMode = "openFilesOnly",
                                },
                            },
                        },
                    })
                end,

                ["ruff"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ruff.setup({
                        capabilities = capabilities,
                        on_attach = function(client, _)
                            -- let pyright own hovers
                            client.server_capabilities.hoverProvider = false
                        end,
                    })
                end,

                ["angularls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.angularls.setup({
                        capabilities = capabilities,
                        cmd = {
                            "ngserver",
                            "--stdio",
                            "--tsProbeLocations",
                            "--ngProbeLocations",
                        },
                        on_new_config = function(new_config, _)
                            new_config.cmd = {
                                "ngserver",
                                "--stdio",
                                "--tsProbeLocations",
                                "--ngProbeLocations",
                            }
                        end,
                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                },
                            },
                        },
                    })
                end,

                ["cssls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.cssls.setup({
                        cmd = { "vscode-css-language-server", "--stdio" },
                        capabilities = capabilities,
                        settings = {
                            scss = {
                                validate = true,
                                lint = {
                                    unknownAtRules = "ignore",
                                },
                            },
                        },
                    })
                end,
            },
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-p>"] = cmp.mapping.select_prev_item({ select = true }),
                ["<C-n>"] = cmp.mapping.select_next_item({ select = true }),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- For luasnip users.
            }, {
                { name = "buffer" },
            }),
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
    end,
}
