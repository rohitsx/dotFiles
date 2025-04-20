return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"ts_ls",
					"denols",
					"lua_ls",
					"html",
					"jsonls",
					"dockerls",
					"cssls",
					"yamlls",
					"svelte",
				},
				automatic_installation = true,
			})
		end,
	},
}
