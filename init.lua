
require 'config.global'
require 'config.lazy'
require 'config.autocommands'

-- =============================
-- Color Scheme 
-- =============================
vim.cmd("colorscheme everforest")


-- =============================
-- Basic Options
-- =============================
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"


vim.keymap.set('i', '<leader>jk', '<ESC>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<Tab>', '>>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', '<<', { noremap = true, silent = true })
vim.keymap.set('v', '<Tab>', '>gv') 
vim.keymap.set('v', '<S-Tab>', '<gv')

-- transparent background if needed
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight ColorColumn ctermbg=none
  highlight ColorColumn guibg=none
  highlight SignColumn ctermbg=none
  highlight SignColumn guibg=none
  highlight LineNr ctermbg=none
  highlight LineNr guibg=none
  highlight CursorLine ctermbg=none
  highlight CursorLine guibg=none
  highlight CursorLineNr ctermbg=none
  highlight CursorLineNr ctermbg=none
  highlight CursorLineNr guibg=none
]]

