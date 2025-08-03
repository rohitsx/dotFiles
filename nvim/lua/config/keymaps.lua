-- Use <C-j> and <C-k> to navigate completion menu when it's visible
-- Falls back to normal <C-j>/<C-k> behavior when menu is not visible
vim.keymap.set("i", "<C-j>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
end, { expr = true, noremap = true })

vim.keymap.set("i", "<C-k>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
end, { expr = true, noremap = true })

