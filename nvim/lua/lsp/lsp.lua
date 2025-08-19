return {
  {
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
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.ts_ls.setup {}
      lspconfig.lua_ls.setup {}
      lspconfig.pyright.setup {}
      lspconfig.stylelint_lsp.setup {}
      lspconfig.svelte.setup {}
      lspconfig.tailwindcss.setup {}
      lspconfig.bashls.setup {}

      -- Format current buffer with LSP
      -- vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

      -- Enable virtual text for diagnostics (inline error/warning messages)
      vim.diagnostic.config({ virtual_text = true })
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })

      vim.keymap.set('i', '<CR>', function()
        if vim.fn.pumvisible() == 1 then
          return '<C-y>' -- Confirm the selected item in the popup menu
        else
          return '<CR>'  -- Normal Enter behavior (insert newline)
        end
      end, { expr = true, noremap = true, silent = true })

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
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        python = { "black" },
        sh = { "shfmt" },
      },
    },
    config = function(_, opts)
      local conform = require("conform")
      conform.setup(opts)

      -- Override <leader>f to use conform with LSP fallback
      vim.keymap.set("n", "<leader>f", function()
        conform.format({ async = true, lsp_fallback = true })
      end, { desc = "Format file" })
    end,
  },

  -- {
  --   "L3MON4D3/LuaSnip",
  --   dependencies = { "rafamadriz/friendly-snippets" },
  -- },
  -- -- Completion engine
  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "saadparwaiz1/cmp_luasnip",
  --   },
  --   config = function()
  --     local cmp = require("cmp")
  --     local luasnip = require("luasnip")
  --
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           luasnip.lsp_expand(args.body)
  --         end,
  --       },
  --       completion = {
  --         completeopt = "menu,menuone,noselect",
  --         keyword_length = 1,
  --       },
  --
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-j>"] = cmp.mapping.select_next_item(),
  --         ["<C-k>"] = cmp.mapping.select_prev_item(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --       }),
  --       sources = {
  --         { name = "nvim_lsp" },
  --         { name = "luasnip" },
  --       },
  --     })
  --   end,
  -- },
}
