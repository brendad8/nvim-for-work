return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",  -- optional, for a bunch of community snippets
      "L3MON4D3/LuaSnip",              -- snippet engine of your choice
      -- you can add more sources or compat if needed
    },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      -- keymap can use presets: "default", "super-tab", "enter", or "none"
      keymap = {
        preset = "default",
        -- you can override or add custom keys:
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        -- e.g. accept with Enter
        ["<CR>"] = { "accept", "fallback" },
      },
      -- which completion sources to use
      sources = {
        default = { "lsp", "buffer", "path", "snippets" },
        -- optionally add more providers / change priorities:
        providers = {
          lsp         = { score_offset = 0 },
          buffer      = { score_offset = -2 },
          path        = { score_offset = -1 },
          snippets    = { score_offset = -1 },
        },
      },
      -- you can customize menu, ghost text, etc — leave defaults or tweak  
      -- e.g. ghost text:
      ghost_text = { enabled = true },
    },
  },
}
