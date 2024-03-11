return {
	"hrsh7th/nvim-cmp",
	version = "*",
	lazy = false,
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		local cmp = require("cmp")

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
				["<C-j>"] = cmp.mapping.select_next_item({ select = true }),
				["<C-k>"] = cmp.mapping.select_prev_item({ select = true }),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
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

		-- Set up lspconfig.
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		lspconfig.astro.setup({
			capabilities = capabilities,
		})

		lspconfig.ltex.setup({})
		lspconfig.eslint.setup({
			capabilities = capabilities,
		})
		lspconfig.zk.setup({
			capabilities = capabilities,
		})

		lspconfig.cssmodules_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		lspconfig.tsserver.setup({
			capabilities = capabilities,
		})

		lspconfig.angularls.setup({
			capabilities = capabilities,
		})

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
		})

		lspconfig.vuels.setup({
			capabilities = capabilities,
		})

		lspconfig.jsonls.setup({
			capabilities = capabilities,
		})
	end,
}
