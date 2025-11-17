return {


  { -- scrollbar
    'dstein64/nvim-scrollview',
    enabled = true,
    opts = {
      current_only = true,
    },
  },

  {
    "echasnovski/mini.pick",
    version = "*",
    config = function()
      local pick = require("mini.pick")

      pick.setup(
        -- {
        --   mappings = {
        --     move_down  = '<Down>',
        --     move_start = '<C-g>',
        --     move_up    = '<Up>',
        --   }
        -- }
      )

    -- Keymaps
      vim.keymap.set("n", "<leader>ff", function()
        pick.builtin.files()
      end, { desc = "Pick files" })

      vim.keymap.set("n", "<leader>fg", function()
        pick.builtin.grep_live()
      end, { desc = "Live grep" })
    end,
  },

  { -- filetree
    'nvim-tree/nvim-tree.lua',
    enabled = true,
    keys = {
      { '<leader>ft', ':NvimTreeToggle<cr>', desc = 'File Tree' },
    },
    config = function()
      require('nvim-tree').setup {
        disable_netrw = false,
        update_focused_file = {
          enable = true,
        },
        git = {
          enable = true,
          ignore = false,
          timeout = 500,
        },
        diagnostics = {
          enable = true,
        },
      }
    end,
  },

}
