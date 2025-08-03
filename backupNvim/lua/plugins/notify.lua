return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		local notify = require("notify")

		notify.setup({
			stages = "slide",
			render = "wrapped-compact",
			background_colour = "#1e1e2e",
			timeout = 800,
			max_width = function()
				return math.floor(vim.o.lines * 1.2)
			end,
			max_height = function()
				return math.floor(vim.o.lines * 4)
			end,
			fps = 60,
		})

		vim.notify = notify
	end,
}
