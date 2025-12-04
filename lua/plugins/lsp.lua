return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "pyright", "lua_ls", "clangd" },
      automatic_installation = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      ------------------------------------------
      -- CAPABILITIES (optional nvim-cmp support)
      ------------------------------------------
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      pcall(function()
        capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
      end)

      -----------------------
      -- on_attach function --
      -----------------------
      local function on_attach(_, bufnr)
        local map = function(mode, lhs, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
        end
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gD", vim.lsp.buf.declaration)
        map("n", "K",  vim.lsp.buf.hover)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>ca", vim.lsp.buf.code_action)
        map("n", "gr", vim.lsp.buf.references)
      end

      ------------------------------------
      -- DEFINE configs using new API   --
      -- vim.lsp.config("name", { ... }) --
      ------------------------------------

      -- PYRIGHT
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- LUA LS
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- CLANGD
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      ----------------------------------
      -- ENABLE configs using new API --
      -- vim.lsp.enable("name")       --
      ----------------------------------
      vim.lsp.enable("pyright")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("clangd")

      ------------------------------------------------------------
      -- OPTIONAL: Safe LspAttach autocommand (no deprecated API)
      ------------------------------------------------------------
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if not client then return end
          vim.schedule(function()
            vim.notify("LSP attached: " .. client.name)
          end)
        end,
      })
    end,
  },
}

