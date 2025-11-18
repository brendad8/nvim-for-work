

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
vmap('>', '>gv')
vmap('<', '<gv')


nmap("<leader>ff", require("fzf-lua").files)
nmap("<leader>fg", require("fzf-lua").live_grep)

