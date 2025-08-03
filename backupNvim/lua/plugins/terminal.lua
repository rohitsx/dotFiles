return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			open_mapping = [[<c-`>]],
			direction = "float",
			shade_terminals = false,
			dir = function()
				return vim.fn.getcwd(vim.api.nvim_get_current_buf())
			end,
			float_opts = {
				border = "rounded", -- you can also use "none"
				winblend = 0, -- no transparency
				highlights = {
					border = "FloatBorder",
					background = "TermGray",
				},
			},
		},
	},
}
