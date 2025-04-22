-- Setup for LazyVim-style
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		lsp = {
			progress = { enabled = true },
			signature = { enabled = true },
			hover = { enabled = true },
		},
		cmdline = {
			enabled = true, -- replaces command line with floating one
		},
		messages = {
			enabled = true, -- replaces normal messages
		},
		presets = {
			bottom_search = true, -- use classic bottom bar for `/` & `?`
			command_palette = true,
			long_message_to_split = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify", -- optional, for nicer notifications
	},
}
