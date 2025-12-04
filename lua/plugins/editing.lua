return {
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {
      toggler = {
        line = "<D-/>",
        block = "<D-*>",
      },
      opleader = {
        line = "<D-/>",
        block = "<D-*>",
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    version = "*",        -- recommended: track latest stable
    event = "InsertEnter", -- lazy-load when typing
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { "string" },
      skip_unbalanced = true,
      markdown = true,
    },
    config = function()
      require("mini.pairs").setup()
    end,
  },
}

