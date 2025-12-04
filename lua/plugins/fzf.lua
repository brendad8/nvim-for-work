return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>",      desc = "Fuzzy find files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>",  desc = "Live grep" },
  },
  opts = {
    winopts = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
  end,
}
