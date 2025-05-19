require("lspconfig").intelephense.setup({
	settings = {
		intelephense = {
			environment = {
				includePaths = {}, -- You can add paths if needed
			},
		},
	},
})
