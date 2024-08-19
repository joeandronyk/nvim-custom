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
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_lspconfig.setup {
      -- list of lps servers for mason to install
      ensure_installed = {
        'lua_ls',
        'pyright',
        'jsonls',
      },
    }

    mason_tool_installer.setup {
      -- list of formatters
      ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'ruff', -- python formatter
        'debugpy',
      },
    }
  end,
}
