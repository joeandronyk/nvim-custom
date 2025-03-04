return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'saghen/blink.cmp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', opts = {} },
    'williamboman/mason.nvim',
    'nvim-lua/plenary.nvim',
    -- { dir = 'D:/Projects/Git/nvim-lspimport' },
    { 'joeandronyk/nvim-lspimport' },
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local mason_lspconfig = require 'mason-lspconfig'
    local keymap = vim.keymap -- for conciseness

    -- disable virtual text (diagnostic messages in line)
    vim.diagnostic.config {
      virtual_text = false,
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = 'See available code actions'
        keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = 'Smart rename'
        keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = 'Show line diagnostics'
        keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = 'Go to previous diagnostic'
        keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = 'Go to next diagnostic'
        keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = 'Show documentation for what is under cursor'
        keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = 'Restart LSP'
        keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary

        opts.desc = 'Import Missing Modules'
        keymap.set('n', '<leader>ci', require('lspimport').import, opts)
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    -- local signs = { Error = 'E', Warn = 'W', Hint = 'H', Info = 'I' }
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    mason_lspconfig.setup_handlers {
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup {
          capabilities = capabilities,
        }
      end,
      ['lua_ls'] = function()
        -- configure lua server (with special settings)
        lspconfig['lua_ls'].setup {
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { 'vim' },
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        }
      end,
      ['pyright'] = function()
        -- configure pyright server (with special settings)
        lspconfig['pyright'].setup {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                useLibraryCodeForTypes = true,
              },
            },
          },
        }
      end,
      ['yamlls'] = function()
        -- configure yamlls server (with special settings)
        lspconfig['yamlls'].setup {
          capabilities = capabilities,
          settings = {
            yaml = {
              schemas = {
                ['https://raw.githubusercontent.com/kedro-org/kedro/develop/static/jsonschema/kedro-catalog-0.17.json'] = 'conf/**/*catalog*',
                ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
                ['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = './.gitlab-ci.yml',
                ['https://json.schemastore.org/pyproject.json'] = 'pyproject.toml',
              },
            },
          },
        }
      end,
      ['taplo'] = function()
        -- configure taplo server for toml files
        lspconfig['taplo'].setup {}
      end,
      -- ['debugpy'] = function()
      --   -- configure debug server (Allows renaming capabilities)
      --   lspconfig['debugpy'].setup {}
      -- end,
    }
  end,
}
