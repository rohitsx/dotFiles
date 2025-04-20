require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "lsp" },
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
})
