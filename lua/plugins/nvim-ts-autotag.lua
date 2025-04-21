return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- Auto-close tags
				enable_rename = true, -- Auto-rename tags
				enable_close_on_slash = false, -- Don't auto-close self-closing tags like <br/>
			},
			-- Optional: filetype-specific overrides (you can remove this if not needed)
			per_filetype = {
				-- ["html"] = { enable_close = false },
				-- ["svelte"] = { enable_rename = false },
			},
		})
	end,
}
