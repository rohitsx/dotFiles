return {
	"vigoux/notifier.nvim",
	config = function()
		require("notifier").setup({
			status_width = 50, -- Set the width of the notification window
			notify = {
				clear_time = 5000, -- Time in ms to clear notifications
				min_level = vim.log.levels.INFO, -- Minimum level for notifications
			},
		})
		-- 🎨 Set custom highlights for notifier.nvim
		vim.api.nvim_set_hl(0, "NotifierTitle", { fg = "#FFD700", bold = true }) -- Gold title
		vim.api.nvim_set_hl(0, "NotifierIcon", { fg = "#00BFFF", bold = true }) -- DeepSkyBlue icon
		vim.api.nvim_set_hl(0, "NotifierContent", { fg = "#FFFFFF" }) -- White content
		vim.api.nvim_set_hl(0, "NotifierContentDim", { fg = "#A9A9A9", italic = true }) -- Dimmed gray content
	end,
}
