return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup()

      local list = harpoon:list()

      vim.keymap.set("n", "<leader>ha", function()
        list:add()
      end, { desc = "Harpoon Add File" })

      vim.keymap.set("n", "<leader>hm", function()
        harpoon.ui:toggle_quick_menu(list)
      end, { desc = "Harpoon Menu" })

      vim.keymap.set("n", "<leader>1", function() list:select(1) end, { desc = "Harpoon File 1" })
      vim.keymap.set("n", "<leader>2", function() list:select(2) end, { desc = "Harpoon File 2" })
      vim.keymap.set("n", "<leader>3", function() list:select(3) end, { desc = "Harpoon File 3" })
      vim.keymap.set("n", "<leader>4", function() list:select(4) end, { desc = "Harpoon File 4" })
      vim.keymap.set("n", "<leader>5", function() list:select(5) end, { desc = "Harpoon File 5" })
    end,
  },
}
