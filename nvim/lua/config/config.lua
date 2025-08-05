-- Disable netrw (built-in file explorer) to avoid conflicts with plugins like nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Optional netrw settings (uncomment if using netrw instead of disabling it)
-- vim.g.netrw_banner = 0                -- Disable the banner at the top of netrw
-- vim.g.netrw_liststyle = 3             -- Use tree-style listing in netrw
-- vim.g.netrw_keepdir = 0               -- Let netrw change the directory as needed
-- vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]  -- Hide dotfiles in netrw
-- vim.g.netrw_hide = 1                  -- Enable hiding of files based on netrw_list_hide

-- Set the number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 2

-- Set the number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Show absolute line numbers on the left side of the window
vim.opt.number = true

-- Set the popup menu height to show a maximum of 15 items
-- vim.o.pumheight = 15

-- use enter in popup to selecte item instead of default ctrl + y
vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-y>' -- Confirm the selected item in the popup menu
  else
    return '<CR>' -- Normal Enter behavior (insert newline)
  end
end, { expr = true, noremap = true, silent = true })
