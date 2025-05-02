return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-neotest/neotest-python',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'python' },
    }

    local neotest = require 'neotest'
    neotest.setup {
      log_level = vim.log.levels.DEBUG,
      adapters = {
        require 'neotest-python' {
          dap = { justMyCode = false },
          runner = 'pytest',
          pytest_discover_instances = false,
          python = function()
            local interpreter = require('venv-selector').python()
            if interpreter then
              return interpreter
            else
              return nil
              -- return '.venv/Scripts/python.exe'
            end
          end,
          args = { '-vv', '--disable-warnings' },
        },
      },
    }

    -- Keymaps for running tests
    vim.keymap.set('n', '<leader>ts', function()
      neotest.summary.open()
      -- neotest.run.run()
      neotest.summary.open()
    end, { desc = 'Open Test Summary' })

    -- vim.keymap.set('n', '<leader>tb', function()
    --   neotest.run.run(vim.fn.expand '%')
    --   neotest.summary.open()
    -- end, { desc = 'Run all tests in current buffer' })

    vim.keymap.set('n', '<leader>ta', function()
      neotest.run.run(vim.fn.getcwd())
      neotest.summary.open()
    end, { desc = 'Run all tests in the tests folder' })

    vim.keymap.set('n', '<leader>td', function()
      neotest.run.attach()
      neotest.summary.open()
    end, { desc = 'Debug tests.' })
  end,
}
