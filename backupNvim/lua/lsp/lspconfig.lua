return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		-- Mason setup
		require("mason").setup()

		-- Mason-LSPConfig bridge setup
		require("mason-lspconfig").setup({
			ensure_installed = {
				-- "denols",
				"docker_compose_language_service",
				"dockerls",
				"dotls",
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"svelte",
				"tailwindcss",
				"yamlls",
				"ts_ls",
			},
			automatic_installation = true,

			handlers = {

				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				-- Custom handler for lua_ls
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,

				-- -- Custom handler for denols
				-- denols = function()
				-- 	require("lspconfig").denols.setup({
				-- 		on_attach = function(client)
				-- 			client.server_capabilities.documentFormattingProvider = false
				-- 		end,
				-- 		root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
				-- 	})
				-- end,
				--
				-- -- Custom handler for tsserver
				-- ts_ls = function()
				-- 	require("lspconfig").tsserver.setup({
				-- 		on_attach = function(client)
				-- 			client.server_capabilities.documentFormattingProvider = false
				-- 		end,
				-- 		root_dir = function(fname)
				-- 			-- Use tsserver only if no deno config is present
				-- 			local util = require("lspconfig.util")
				-- 			local deno_root = util.root_pattern("deno.json", "deno.jsonc")(fname)
				-- 			if deno_root then
				-- 				return nil
				-- 			end
				-- 			return util.root_pattern("package.json", "tsconfig.json")(fname)
				-- 		end,
				-- 	})
				-- end,

				tailwindcss = function()
					require("lspconfig").tailwindcss.setup({
						settings = {
							tailwindCSS = {
								classAttributes = { "class", "className", "classList", "ngClass" },
								classFunctions = { "cva", "cx" },
							},
						},
					})
				end,

				-- Custom handler for pyright
				pyright = function()
					require("lspconfig").pyright.setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
						settings = {
							python = {
								analysis = {
									autoSearchPaths = true,
									useLibraryCodeForTypes = true,
									diagnosticMode = "workspace",
								},
							},
						},
					})
				end,
			},
		})
	end,
}
