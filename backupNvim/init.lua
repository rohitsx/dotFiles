require("config.lazy")

local config = function()
	local opt = vim.opt
	opt.fillchars:append({ eob = " " })
	opt.clipboard = "unnamedplus" -- Use system clipboard
	opt.number = true -- Show line numbers
	opt.mouse = "a" -- Enable mouse support
	opt.ignorecase = true -- Ignore case when searching
	opt.wrap = true -- Enable line wrapping

	opt.tabstop = 2 -- Number of spaces a tab counts for
	opt.shiftwidth = 2 -- Number of spaces for indentation
end

local keymap = function()
	local map = vim.keymap.set
	local api = require("nvim-tree.api")

	map("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
	map("n", "<leader>q", ":q<CR>", { desc = "Quit Vim" })
	map("i", "<M-BS>", "<C-w>", { desc = "Delete previous word" })
	map("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
	map("n", "<M-x>", '"_dd', { desc = "Delete line without storing" })
	map("n", "<leader>a", ":keepjumps normal! ggVG<cr>")

	map("n", "<leader>e", function()
		api.tree.toggle({ focus = true })
	end, { desc = "Toggle NvimTree" })
end

local diagnostic = function()
	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		float = { border = "rounded" },
		update_in_insert = false,
		severity_sort = true,
	})

	vim.o.updatetime = 250
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })
end

local function panle()
	vim.keymap.set("n", "<C-h>", "<C-w>h")
	vim.keymap.set("n", "<C-j>", "<C-w>j")
	vim.keymap.set("n", "<C-k>", "<C-w>k")
	vim.keymap.set("n", "<C-l>", "<C-w>l")

	vim.keymap.set("n", "<A-h>", "<C-w><") -- Resize left
	vim.keymap.set("n", "<A-l>", "<C-w>>") -- Resize right
	vim.keymap.set("n", "<A-j>", "<C-w>+") -- Resize up
	vim.keymap.set("n", "<A-k>", "<C-w>-") -- Resize down
end

local ui = function()
	local cmd = vim.cmd

	cmd("colorscheme retrobox")
end

config()
keymap()
diagnostic()
ui()
panle()
