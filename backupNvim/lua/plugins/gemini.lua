return  {
    'meinside/gmn.nvim', config = function()
      require'gmn'.setup {
        -- (default values)
        configFilepath = '~/.config/gmn.nvim/config.json',
        timeout = 30 * 1000,
        model = 'gemini-2.0-flash',
        safetyThreshold = 'BLOCK_ONLY_HIGH',
        stripOutermostCodeblock = function()
          return vim.bo.filetype ~= 'markdown'
        end,
        verbose = false,
      }
    end,
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  }
