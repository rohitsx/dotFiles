return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	-- Completion engine
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip", -- ADD THIS LINE
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- ADD THIS BLOCK
					end,
				},
				completion = {
					completeopt = "menu,menuone,noselect",
					keyword_length = 1,
				},

				performance = {
					max_view_entries = 8,
				},

				mapping = cmp.mapping.preset.insert({
					["<S-j>"] = cmp.mapping.select_next_item(),
					["<S-k>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- ADD THIS
				},
			})
		end,
	},
}
