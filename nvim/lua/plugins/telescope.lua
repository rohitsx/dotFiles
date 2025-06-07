return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-h>"] = actions.which_key,
					},
				},
			},
		})

		-- Global keybindings
		vim.keymap.set("n", "<A-p>", builtin.find_files, { desc = "Telescope: Find Files" })
		vim.keymap.set("n", "<A-f>", builtin.current_buffer_fuzzy_find, { desc = "Telescope: Find in Buffer" })
		vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "Telescope: Live Grep" })
	end,
}
