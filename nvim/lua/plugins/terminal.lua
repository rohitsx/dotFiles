return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<c-`>]],
			direction = "float",
			dir = function()
				return vim.fn.getcwd(vim.api.nvim_get_current_buf())
			end,
			float_opts = {
				border = "curved",
				winblend = 3,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		},
	},
}
