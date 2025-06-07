local map = vim.keymap.set

map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit Vim" })
map("i", "<M-BS>", "<C-w>", { desc = "Delete previous word" })
map("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
map("n", "<M-x>", '"_dd', { desc = "Delete line without storing" })
map("n", "<leader>a", ":keepjumps normal! ggVG<cr>")
