return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'saghen/blink.cmp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/neodev.nvim', opts = {} },
    'williamboman/mason.nvim',
    'nvim-lua/plenary.nvim',
    { 'joeandronyk/nvim-lspimport' },
  },
  config = function()
    -- Configure general LSP settings
    vim.lsp.enable 'pyright'
    vim.lsp.enable 'lua_ls'
    vim.lsp.enable 'yamlls'
    vim.lsp.enable 'taplo'

    -- Diagnostics settings (disable virtual text)
    vim.diagnostic.config {
      virtual_text = false,
    }

    -- Setup default keybindings for all LSP servers
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        vim.keymap.set("n", "<leader>ci", require("lspimport").import, opts)
      end,
    })

    -- Set capabilities for auto-completion
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Configure LSP servers with custom settings
    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { 'vim' } },
          completion = { callSnippet = 'Replace' },
        },
      },
    })

    vim.lsp.config('pyright', {
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = 'workspace',
            useLibraryCodeForTypes = true,
          },
        },
      },
    })

    vim.lsp.config('yamlls', {
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
    })

    -- Change diagnostic symbols in sign column
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end
  end,
}
