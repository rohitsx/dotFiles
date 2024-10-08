local opt = vim.opt
local g = vim.g

vim.cmd("colorscheme duskfox")
opt.clipboard = "unnamedplus"
opt.number = true
opt.mouse = 'a'
opt.ignorecase = true
opt.hlsearch = false
opt.wrap = true
opt.breakindent = true
opt.tabstop = 4
opt.shiftwidth = 4

-- file explorer
g.netrw_winsize = 10
g.netrw_banner = 0
g.mapleader = ' '
