
local nmap = function(key, effect, desc)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true, desc = desc })
end

local vmap = function(key, effect, desc)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true, desc = desc })
end

-- local imap = function(key, effect, desc)
--   vim.keymap.set('i', key, effect, { silent = true, noremap = true, desc = desc })
-- end
--
-- local cmap = function(key, effect, desc)
--   vim.keymap.set('c', key, effect, { silent = true, noremap = true, desc = desc })
-- end


nmap('<leader>w', ':write<CR>')
nmap('<Tab>', '>>')
nmap('<S-Tab>', '<<')
vmap('<Tab>', '>gv')
vmap('<S-Tab>', '<gv')

local fzf = require("fzf-lua")

nmap("<leader>ff", fzf.files)
nmap("<leader>fg", fzf.live_grep)


local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>fh", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>H", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
