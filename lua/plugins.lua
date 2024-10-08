return require("packer").startup(function()
	-- install plugin here

	use("wbthomason/packer.nvim")
	use("neovim/nvim-lspconfig")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("folke/noice.nvim")
	use("MunifTanjim/nui.nvim")
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("hrsh7th/nvim-cmp") -- Completion engine
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("hrsh7th/cmp-buffer") -- Buffer completions
	use("hrsh7th/cmp-path") -- Path completions
	use("hrsh7th/cmp-cmdline") -- Cmdline completions

	use({
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"saadparwaiz1/cmp_luasnip",
		"lukas-reineke/cmp-under-comparator",
	})
	local actions = require("telescope.actions")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } },
		defaults = {
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
		},
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		ensure_installed = { "javascript", "python", "lua", "nim" }, -- Install parsers
		highlight = {
			enable = true, -- Enable syntax highlighting
		},
		incremental_selection = {
			enable = true,
		},
		indent = {
			enable = true, -- Enable smart indentation
		},
		run = ":TSUpdate",
	})

	use("echasnovski/mini.nvim")

	-- Snippet support
	use("hrsh7th/vim-vsnip") -- Snippet engine
	use("hrsh7th/cmp-vsnip")

	use("sbdchd/neoformat")

	use("echasnovski/mini.icons")

	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	})

	use("nvim-tree/nvim-web-devicons")
	use("Exafunction/codeium.vim")
	use({ "axkirillov/hbac.nvim" })
	use("mhinz/vim-startify")
	use("EdenEast/nightfox.nvim") -- Packer
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	-- setup plugin here
	require("lualine").setup({ options = { theme = "wombat" } })
	require("noice").setup()
	require("plugins.lsp").setup()
	require("plugins.cmp").setup()
	require("hbac").setup({
		autoclose = true, -- set autoclose to false if you want to close manually
		threshold = 4, -- hbac will start closing unedited buffers once that number is reached
		close_command = function(bufnr)
			vim.api.nvim_buf_delete(bufnr, {})
		end,
		close_buffers_with_windows = false, -- hbac will close buffers with associated windows if this option is `true`
		telescope = {
			-- See #telescope-configuration below
		},
	})
end)
