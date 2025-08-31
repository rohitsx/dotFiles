-- This page contain list of basic nvim plugin that are good for better ui and expreince they don't directly do anything aside from making nvim more fun and beatulifuu

return {
	-- Tracks your coding activity and syncs with your WakaTime dashboard
	{ "wakatime/vim-wakatime" },
	{
		-- A statusline plugin written in Lua with rich customization
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Adds icons to the statusline
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "gruvbox", -- Sets the lualine theme
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					always_show_tabline = true,
					globalstatus = false,
					refresh = {
						statusline = 100,
						tabline = 100,
						winbar = 100,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
	{
		-- "windwp/nvim-autopairs",
		-- config = true,
	},
}
