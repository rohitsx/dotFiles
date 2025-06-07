return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,

	-- Setup configuration and keybindings
	config = function()
		-- Set up the plugin configuration
		require("oil").setup({
			-- You can pass custom options for oil.nvim here
			-- Example: setting up the default view and behavior
			view_options = { show_hidden = true },
		})

		-- Keybindings for oil.nvim
		vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

		-- Add more keybindings as needed
	end,
}
