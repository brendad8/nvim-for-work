return {

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      {
        'mason-org/mason-lspconfig.nvim',
        opts = {
          automatic_enable = false,
          ensure_installed = {
            'lua_ls',
            'pyright',
            'r_language_server',
            'clangd',
            'rust_analyzer',
          },
        },
      },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
          ensure_installed = {
            'ruff',
            'stylua',
            'shfmt',
            'tree-sitter-cli',
            'jupytext',
          },
        },
      },
      {
        {
          'folke/lazydev.nvim',
          ft = 'lua',
          opts = {
            library = {
              { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            },
          },
        },
        { 'Bilal2453/luvit-meta', lazy = true },
      },
      { 'folke/neoconf.nvim', opts = {}, enabled = false },
    },
    config = function()
      local util = require 'lspconfig.util'

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local function map(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          assert(client, 'LSP client not found')

          ---@diagnostic disable-next-line: inject-field
          client.server_capabilities.document_formatting = true

          map('gd', vim.lsp.buf.definition, '[g]o to [d]efinition')
          map('gD', vim.lsp.buf.type_definition, '[g]o to type [D]efinition')
          map('<leader>lq', vim.diagnostic.setqflist, '[l]sp diagnostic [q]uickfix')
        end,
      })

      local lsp_flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 150,
      }

      local capabilities
      local has_blink, blink = pcall(require, 'blink')
      if has_blink then
        capabilities = blink.get_lsp_capabilities({}, true)
      else
        capabilities = vim.lsp.protocol.make_client_capabilities()
      end

      -- set defaults for all clients
      vim.lsp.config('*', {
        capabilities = capabilities,
        flags = lsp_flags,
        root_markers = { '.git/' },
      })


      vim.lsp.config.r_language_server = {
        filetypes = { 'r' }, 
        settings = {
          r = {
            lsp = {
              rich_documentation = true,
            },
          },
        },
      }


      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              disable = { 'trailing-space' },
            },
            workspace = {
              checkThirdParty = false,
            },
            doc = {
              privateName = { '^_' },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }


      -- See https://github.com/neovim/neovim/issues/23291
      -- disable lsp watcher.
      -- Too lags on linux for python projects
      -- because pyright and nvim both create too many watchers otherwise
      if capabilities.workspace == nil then
        capabilities.workspace = {}
        capabilities.workspace.didChangeWatchedFiles = {}
      end
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

      vim.lsp.config.pyright = {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'workspace',
            },
          },
        },
        root_markers = { '.git', 'setup.py', 'setup.cfg', 'pyproject.toml', 'requirements.txt' },
      }

      -- enable the servers
      vim.lsp.enable 'r_language_server'
      vim.lsp.enable 'clangd'
      vim.lsp.enable 'lua_ls'
      vim.lsp.enable 'bashls'
      vim.lsp.enable 'pyright'
      vim.lsp.enable 'rust_analyzer'
      -- vim.lsp.enable 'ruff_lsp'

    end,
  },
}
