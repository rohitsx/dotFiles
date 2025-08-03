return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    require("lspconfig").lua_ls.setup {}
    require("lspconfig").ts_ls.setup {}

    -- Format current buffer with LSP
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

    -- Enable virtual text for diagnostics (inline error/warning messages)
    vim.diagnostic.config({ virtual_text = true })
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })


    -- Completion settings to prevent auto-selecting the first item
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    -- Auto command for when LSP attaches to a buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        -- Enable auto-completion if supported
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/completion') then
          -- Optional: trigger autocompletion on EVERY keypress. May be slow!
          local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
          client.server_capabilities.completionProvider.triggerCharacters = chars

          -- Enable LSP completion with autotrigger
          vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
      end,
    })
  end,
}
