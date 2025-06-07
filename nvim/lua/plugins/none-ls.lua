-- return {
-- 	"nvimtools/none-ls.nvim", -- or "jose-elias-alvarez/null-ls.nvim" if using older version
-- 	config = function()
-- 		local null_ls = require("null-ls")
--
-- 		null_ls.setup({
-- 			sources = {
-- 				null_ls.builtins.formatting.prettier, -- for js/ts
-- 				null_ls.builtins.formatting.stylua, -- for lua
-- 				null_ls.builtins.formatting.black, -- for python
-- 				null_ls.builtins.formatting.phpcsfixer.with({ -- for php
-- 					command = "php-cs-fixer",
-- 					args = { "fix", "--using-cache=no" },
-- 					filetypes = { "php" },
-- 				}),
-- 			},
-- 			on_attach = function(client, bufnr)
-- 				if client.supports_method("textDocument/formatting") then
-- 					local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- 					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--
-- 					vim.api.nvim_create_autocmd("BufWritePre", {
-- 						group = augroup,
-- 						buffer = bufnr,
-- 						callback = function()
-- 							vim.lsp.buf.format({ bufnr = bufnr })
-- 						end,
-- 					})
-- 				end
-- 			end,
-- 		})
-- 	end,
-- }
--

return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Make sure this dependency is included
	},
	config = function()
		local null_ls = require("null-ls")

		-- Debug function to check if formatters are available
		local function check_formatters()
			local formatters = {
				"prettier",
				"stylua",
				"black",
				"php-cs-fixer",
			}

			for _, formatter in ipairs(formatters) do
				local is_available = vim.fn.executable(formatter) == 1
				vim.notify(
					formatter .. " is " .. (is_available and "available" or "NOT available"),
					is_available and vim.log.levels.INFO or vim.log.levels.WARN
				)
			end
		end

		-- Run the check when plugin loads
		vim.defer_fn(check_formatters, 1000)

		-- Add a command to manually check formatters
		vim.api.nvim_create_user_command("CheckFormatters", check_formatters, {})

		-- Setup none-ls with more robust error handling
		null_ls.setup({
			debug = true, -- Enable debug mode to see what's happening
			sources = {
				null_ls.builtins.formatting.prettier.with({
					-- Only enable if executable exists
					condition = function()
						return vim.fn.executable("prettier") == 1
					end,
				}),
				null_ls.builtins.formatting.stylua.with({
					condition = function()
						return vim.fn.executable("stylua") == 1
					end,
				}),
				null_ls.builtins.formatting.black.with({
					condition = function()
						return vim.fn.executable("black") == 1
					end,
				}),
				null_ls.builtins.formatting.phpcsfixer.with({
					command = "php-cs-fixer",
					args = { "fix", "--using-cache=no" },
					filetypes = { "php" },
					condition = function()
						return vim.fn.executable("php-cs-fixer") == 1
					end,
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					local augroup = vim.api.nvim_create_augroup("LspFormatting_" .. bufnr, {})

					-- Make the augroup unique per buffer to avoid conflicts
					vim.api.nvim_clear_autocmds({ group = augroup })

					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- More robust formatting with error handling
							local success, err = pcall(function()
								vim.lsp.buf.format({
									bufnr = bufnr,
									timeout_ms = 5000, -- Increase timeout to 5 seconds
								})
							end)

							if not success then
								vim.notify("Formatting failed: " .. tostring(err), vim.log.levels.WARN)
							end
						end,
					})

					-- Log that formatting has been set up for this buffer
					vim.notify("Formatting enabled for buffer " .. bufnr, vim.log.levels.INFO)
				end
			end,
		})
	end,
}
