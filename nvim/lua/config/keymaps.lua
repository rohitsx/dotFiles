local map = vim.keymap.set


map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit Vim" })


map("i", "\"", "\"\"<Left>")
map("i", "'", "''<Left>")
map("i", "(", "()<Left>")
map("i", "[", "[]<Left>")
map("i", "{", "{}<Left>")

-- Auto-insert closing brace on newline
map("i", "{<CR>", "{<CR>}<Esc>O")

-- Auto-insert semicolon after closing brace
map("i", "{;<CR>", "{<CR>};<Esc>O")

-- Use <C-j> and <C-k> to navigate completion menu when it's visible
-- Falls back to normal <C-j>/<C-k> behavior when menu is not visible
map("i", "<C-j>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
end, { expr = true, noremap = true })

map("i", "<C-k>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
end, { expr = true, noremap = true })

-- Resize windows using Alt + h/j/k/l
local opts = { noremap = true, silent = true }
map('n', '<A-h>', '<cmd>vertical resize -2<CR>', opts) -- shrink horizontally
map('n', '<A-l>', '<cmd>vertical resize +2<CR>', opts) -- expand horizontally
map('n', '<A-j>', '<cmd>resize -2<CR>', opts)          -- shrink vertically
map('n', '<A-k>', '<cmd>resize +2<CR>', opts)          -- expand vertically
map('n', '<A-=>', '<C-w>=', opts)                      -- equalize window sizes
