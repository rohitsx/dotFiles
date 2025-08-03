-- ~/.config/nvim/lua/plugins/indent-lines.lua
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl", -- use the new API
	opts = {
		indent = {
			char = "│", -- or "", "⎸", etc.
		},
		scope = {
			enabled = false,
		},
	},
}
