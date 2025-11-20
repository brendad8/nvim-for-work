return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          python = {
            command = { "ipython" }, -- or "python3",
            block_dividers = { "#%%" },
          },
          lua = {
            command = { "lua" }
          },
        },
        repl_open_cmd = require("iron.view").split.vertical.botright(40),
      },
      keymaps = {
        toggle_repl = "<leader>ri",
        restart_repl = "<leader>rr",
        

        -- send_motion = "<leader>rc",

        send_line = "<leader>rl",
        visual_send = "<leader>rc",
        -- send_paragraph = "<leader>rp",
        send_code_block = "<leader>rp",
        send_code_block_and_move = "<leader>rpm",

        send_until_cursor = "<leader>rb",
        send_file = "<leader>rf",

        send_mark = "<leader>rm",
        mark_motion = "<leader>mc",
        mark_visual = "<leader>mc",
        remove_mark = "<leader>md",
      },
      highlight = {
        italic = true
      },
      ignore_blank_lines = true,
    })
  end,
}
-- vim.keymap.set("n", "<leader>ri", "<cmd>IronRepl<cr>", { desc = "Open REPL" })
-- vim.keymap.set("n", "<leader>rr", "<cmd>IronRestart<cr>", { desc = "Restart REPL" })
-- vim.keymap.set("n", "<leader>rx", "<cmd>IronClose<cr>", { desc = "Close REPL" })

--[[
TODO:

figure out command to initiate repl with uv... :split term:: ipython

set commands for running line, cell, before cursor, entire file

find way to clear repl (typing clear in repl works)



]]--
