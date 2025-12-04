
local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- use stable branch
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
  root = fn.stdpath("data") .. "/lazy", -- where install plugins to
  defaults = { lazy = true, version = false }, -- default lazy-loading
  checker = { enabled = true }, -- check for updates
  performance = {
    rtp = {
      -- disable some rtp plugins if desired
      disabled_plugins = { },
    },
  },
}
require("lazy").setup("plugins", lazy_opts)
