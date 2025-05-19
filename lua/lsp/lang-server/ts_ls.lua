local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.ts_ls.setup({
	capabilities = capabilities,
	--	root_dir = lspconfig.util.root_pattern("package.json", "pnpm-lock.yaml"),
	single_file_support = false,
})
