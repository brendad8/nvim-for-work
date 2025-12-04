-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Package Manager
require("config.lazy")

-- Colorscheme
vim.cmd("colorscheme everforest")

-- Options
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

-- Keymaps
vim.keymap.set("n", "<Tab>", ">>", { silent = true, noremap = true })
vim.keymap.set("n", "<S-Tab>", "<<", { silent = true, noremap = true })

vim.keymap.set("v", "<Tab>", ">gv", { silent = true, noremap = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { silent = true, noremap = true })

vim.keymap.set("n", "<leader>-", "<C-W>s", { silent = true, noremap = true})
vim.keymap.set("n", "<leader>|", "<C-W>v", { silent = true, noremap = true})

