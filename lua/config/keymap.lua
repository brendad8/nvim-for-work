

local nmap = function(key, effect, desc)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true, desc = desc })
end

local vmap = function(key, effect, desc)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true, desc = desc })
end

local imap = function(key, effect, desc)
  vim.keymap.set('i', key, effect, { silent = true, noremap = true, desc = desc })
end

local cmap = function(key, effect, desc)
  vim.keymap.set('c', key, effect, { silent = true, noremap = true, desc = desc })
end


-- vim.keymap.set('i', '<leader>jk', '<ESC>')
-- vim.keymap.set('n', '<leader>w', ':write<CR>')
-- vim.keymap.set('n', '<Tab>', '>>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<S-Tab>', '<<', { noremap = true, silent = true })
-- vim.keymap.set('v', '<Tab>', '>gv') 
-- vim.keymap.set('v', '<S-Tab>', '<gv')

-- imap('<leader>jk', '<ESC>')
-- nmap('<leader>w', ':write<CR>')
-- nmap('<Tab>', '>>')
-- nmap('<S-Tab>', '<<')
-- vmap('>', '>gv')
-- vmap('<', '<gv')



