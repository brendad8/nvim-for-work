return {
  "Vigemus/iron.nvim",
  cmd = { "IronRepl", "IronRestart", "IronFocus" },
  keys = {
    { "<leader>rs", "<cmd>IronRepl<cr>", desc = "Start REPL" },
    { "<leader>rr", "<cmd>IronRestart<cr>", desc = "Restart REPL" },
    { "<leader>rf", "<cmd>IronFocus<cr>", desc = "Focus REPL" },
  },
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        repl_definition = {
          python = {
            command = { "python3" },
            format = common.bracketed_paste_python,
            block_dividers = { "#%%" },
            env = {PYTHON_BASIC_REPL = "1"} --this is needed for python3.13 and up.
          },
          r = {
            command = { "R" },
          },
        },
        repl_open_cmd = view.split.vertical.rightbelow("%40"),
        --
        -- repl_open_cmd = "horizontal botright 15 split",

        -- Automatically close REPL when Neovim exits
        close_window_on_exit = true,

        -- Whether the REPL is scratch or listed
        scratch_repl = true,

        -- Disable automatic keymaps (we define our own)
        keymaps = {},

        -- Highlight last sent text
        highlight = {
          italic = true,
        },

        -- Ignore blank lines when sending
        ignore_blank_lines = true,
      },

      ----------------------------------------------------------------------------
      -- KEYMAPS (iron-provided helpers)
      ----------------------------------------------------------------------------
      keymaps = {
        send_line = "<leader>sl",
        visual_send = "<leader>sc",
        send_paragraph = "<space>sp",
        send_code_block = "<leader>sb",
        send_code_block_and_move = "<leader>sn",
        send_until_cursor = "<leader>su",
        send_file = "<leader>sf",
        cr = "<leader>s<cr>",
        interrupt = "<leader>s<leader>",
        toggle_repl = "<space>rr",
        exit = "<leader>sq",
        clear = "<leader>cl",
      },

    ignore_blank_lines = true, -- ignore blank lines when sending visual select lines

      ----------------------------------------------------------------------------
      -- WINDOW BEHAVIOR
      ----------------------------------------------------------------------------
      highlight_last = true,
      highlight_timeout = 150,
    })

    vim.keymap.set("n", "<leader>cb", function()
      local row = vim.api.nvim_win_get_cursor(0)[1]
      vim.api.nvim_buf_set_lines(0, row, row, false, { "#%%", "" })
      vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
    end, { desc = "Insert cell delimiter (#%%)" })

  end,
}
