return {
	"neovim/nvim-lspconfig",
	config = function()
		require("lsp.lang-server.pyright")
		require("lsp.lang-server.ts_ls")
		require("lsp.lang-server.denols")
		require("lsp.lang-server.lua_ls")
		require("lsp.lang-server.jsonls")
		require("lsp.lang-server.html")
		require("lsp.lang-server.dockerls")
		require("lsp.lang-server.cssls")
		require("lsp.lang-server.yamlls")
		require("lsp.lang-server.svelte")

		-- Diagnostic config
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		-- Show popup on CursorHold
		vim.o.updatetime = 250
		vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])
	end,
}
