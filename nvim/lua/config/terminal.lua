local map = vim.keymap.set

local term_buf = nil
local term_win = nil
local term_height = 15

map("n", "<C-`>", function()
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) and vim.api.nvim_buf_is_loaded(term_buf) then
    if term_win and vim.api.nvim_win_is_valid(term_win) then
      term_height = vim.api.nvim_win_get_height(term_win)
      vim.api.nvim_win_hide(term_win)
    else

      vim.cmd("botright " .. term_height .. "split")
      term_win = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_buf(term_win, term_buf)
    end
  else
    vim.cmd("botright " .. term_height .. "split | terminal")
    term_buf = vim.api.nvim_get_current_buf()
    term_win = vim.api.nvim_get_current_win()
  end
end, { noremap = true, silent = true, desc = "Toggle terminal" })

