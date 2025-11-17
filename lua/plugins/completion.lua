return {
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
      require('nvim-autopairs').remove_rule '`'
    end,
  },

  { -- new completion plugin
    'saghen/blink.cmp',
    enabled = true,
    dev = false,
    -- version = '*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    build = 'cargo build --release',
    lazy = false,
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
      { 'moyiz/blink-emoji.nvim' },
      { 'Kaiser-Yang/blink-cmp-git' },
      {
        'saghen/blink.compat',
        dev = false,
        opts = { impersonate_nvim_cmp = true, enable_events = true, debug = true },
      },
      { 'kdheepak/cmp-latex-symbols' },
      { 'erooke/blink-cmp-latex' },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ['<Esc>'] = { 'cancel', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'accept', 'fallback' },
        -- ['<c-y>'] = { 'show', 'show_documentation', 'hide_documentation' },
      },
      -- keymap = {
      --   preset = 'enter',
      --   ['<c-y>'] = { 'show', 'show_documentation', 'hide_documentation' },
      --   ['<c-k>'] = {},
      -- },
      cmdline = {
        enabled = false,
      },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority ()
            score_offset = 100,
          },
          symbols = { name = 'symbols', module = 'blink.compat.source' },
        },
      },
      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
          treesitter_highlighting = true,
        },
        menu = {
          auto_show = true,
        },
      },
      signature = { enabled = true },
    },
  },
}
