require("config.lazy")
require("config.netrw")

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Show absolute line numbers on the left side of the window
vim.opt.number = true

-- Set the popup menu (completion suggestions) height to show a maximum of 15 items
vim.o.pumheight = 15

vim.keymap.set("i", "\"", "\"\"<Left>")
vim.keymap.set("i", "'", "''<Left>")
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "{", "{}<Left>")

-- Auto-insert closing brace on newline
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")

-- Auto-insert semicolon after closing brace
vim.keymap.set("i", "{;<CR>", "{<CR>};<Esc>O")
--keyMaps

-- Use <C-j> and <C-k> to navigate completion menu when it's visible
-- Falls back to normal <C-j>/<C-k> behavior when menu is not visible
vim.keymap.set("i", "<C-j>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
end, { expr = true, noremap = true })

vim.keymap.set("i", "<C-k>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
end, { expr = true, noremap = true })
