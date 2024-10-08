local map = vim.keymap.set
local builtin = require("telescope.builtin")

map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit Vim" })
map("i", "<M-BS>", "<C-w>", { desc = "Delete previous word" })
map("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
map("n", "<M-x>", '"_dd', { desc = "Delete line without storing" })
map("n", "<leader>a", ":keepjumps normal! ggVG<cr>")
map("n", "<leader>R", "<cmd>PackerSync<cr>", { desc = "Packege Sync" })






map("n", "<M-p>", builtin.find_files, { desc = "Telescope find files" })
map("n", "<M-f>", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<M-;>", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Neoformat<CR>", { noremap = true, silent = true })

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("i", "<Tab>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })


