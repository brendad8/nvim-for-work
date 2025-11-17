return {

  { -- commenting with e.g. `gcc` or `gcip`
    'numToStr/Comment.nvim',
    enabled = true,
    opts = {
      toggler = {
        line = '<D-/>',
        block = '<D-*>',
      },
      opleader = {
        line = '<D-/>',
        block = '<D-*>',
      },
    },
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    enabled = true,
    keys = {
      { '<leader>cf', '<cmd>lua require("conform").format()<cr>', desc = '[f]ormat' },
    },
    config = function()
      require('conform').setup {
        notify_on_error = false,
        -- format_on_save = {
        --   timeout_ms = 500,
        --   lsp_fallback = true,
        -- },
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'ruff' },
          r = { 'styler' },
        },
        formatters = {
          -- mystylua = {
          --   command = 'stylua',
          --   args = { '--indent-type', 'Spaces', '--indent-width', '2', '-' },
          -- },
        },
      }
    end,
  },

}
