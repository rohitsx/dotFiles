-- General Options
local opt = vim.opt

vim.cmd("colorscheme retrobox")

opt.clipboard = "unnamedplus" -- Use system clipboard
opt.number = true -- Show line numbers
opt.mouse = "a" -- Enable mouse support
opt.ignorecase = true -- Ignore case when searching
opt.wrap = true -- Enable line wrapping

opt.tabstop = 2 -- Number of spaces a tab counts for
opt.shiftwidth = 2 -- Number of spaces for indentation
