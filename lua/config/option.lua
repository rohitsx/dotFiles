-- General Options
local opt = vim.opt

vim.cmd("colorscheme retrobox")

opt.clipboard = "unnamedplus" -- Use system clipboard
opt.number = true             -- Show line numbers
opt.mouse = "a"               -- Enable mouse support
opt.ignorecase = true         -- Ignore case when searching
opt.wrap = true               -- Enable line wrapping

opt.tabstop = 2               -- Number of spaces a tab counts for
opt.shiftwidth = 2            -- Number of spaces for indentation

-- cursor style
opt.guicursor = {
	"n-v-c:block",                                -- Normal, Visual, and Command mode: block (non-blinking)
	"i:ver25-blinkwait700-blinkon400-blinkoff250", -- Insert mode: blinking vertical bar
}

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("autoupdate", { clear = true }),
	callback = function()
		require("lazy").update({ show = false })
	end,
})
