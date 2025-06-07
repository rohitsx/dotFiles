-- General Options
local opt = vim.opt
local cmd = vim.cmd

cmd("colorscheme retrobox")
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
	callback = function()
		local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
		if not normal.bg then
			return
		end
		io.write(string.format("\027]11;#%06x\027\\", normal.bg))
	end,
})

vim.api.nvim_create_autocmd("UILeave", {
	callback = function()
		io.write("\027]111\027\\")
	end,
})

cmd([[
  highlight Normal       guibg=#2a2a2e guifg=#cdd6f4
  highlight NormalFloat  guibg=#2a2a2e
  highlight TermNormal   guibg=#2a2a2e
]])

opt.fillchars:append({ eob = " " })
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.number = true -- Show line numbers
opt.mouse = "a" -- Enable mouse support
opt.ignorecase = true -- Ignore case when searching
opt.wrap = true -- Enable line wrapping

opt.tabstop = 2 -- Number of spaces a tab counts for
opt.shiftwidth = 2 -- Number of spaces for indentation

-- cursor style
opt.guicursor = {
	"n-v-c:block", -- Normal, Visual, and Command mode: block (non-blinking)
	"i:ver25-blinkwait700-blinkon400-blinkoff250", -- Insert mode: blinking vertical bar
}

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("autoupdate", { clear = true }),
	callback = function()
		require("lazy").update({ show = false })
	end,
})
