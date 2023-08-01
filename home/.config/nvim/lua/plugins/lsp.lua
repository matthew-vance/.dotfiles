return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			{
				"williamboman/mason.nvim",
				build = function()
					pcall(function()
						vim.cmd([[MasonUpdate]])
					end)
				end,
			},
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			{
				"jose-elias-alvarez/null-ls.nvim",
				dependencies = { "plenary.nvim" },
			},
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
				dependencies = {
					"mason.nvim",
					"null-ls.nvim",
				},
			},
		},
		config = function()
			-- start lsp setup
			local lsp = require("lsp-zero")

			lsp.preset("recommended")

			lsp.ensure_installed({
				"lua_ls",
				"tsserver",
				"jsonls",
			})

			lsp.on_attach(function(client, bufnr)
				lsp.default_keymaps({ buffer = bufnr })
			end)

			local format_opts = {
				format_opts = {
					async = false,
					timeout_ms = 10000,
				},

				servers = {
					["null-ls"] = {
						"javascript",
						"typescript",
						"lua",
						"terraform",
						"html",
						"proto",
						"json",
					},
				},
			}

			lsp.format_mapping("gq", format_opts)

			lsp.format_on_save(format_opts)

			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

			lsp.setup()
			-- end lsp setup

			-- start cmp setup
			local cmp = require("cmp")

			cmp.setup({
				mapping = {
					["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
					["<C-e>"] = cmp.mapping.abort(), -- close completion window
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				},
			})
			-- end cmp setup

			-- start null-ls setup
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.terraform_fmt,
					null_ls.builtins.diagnostics.terraform_validate,
					null_ls.builtins.formatting.jq,
				},
			})

			require("mason-null-ls").setup({
				ensure_installed = nil,
				automatic_installation = true,
			})
			-- end null-ls setup
		end,
	},
}
