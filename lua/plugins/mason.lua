return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },

  config = function()
    -- import mason
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    -- enable mason and configure icons
    mason.setup {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_lspconfig.setup {
      lazy = true,
      ensure_installed = {
        'lua_ls',
        'pyright',
        'jsonls',
        'yamlls',
      },
    }

    mason_tool_installer.setup {
      lazy = true,
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'ruff', -- python formatter
        'debugpy',
      },
    }
  end,
}
