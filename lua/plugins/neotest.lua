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
          args = { '-vv', '--benchmark-skip' },
          python = function()
            local interpreter = require('venv-selector').python()
            vim.notify('Python interpreter is: ', p)
            return interpreter
          end,
          -- pytest_discover_instances = true,
        },
      },
    }

    -- Keymaps for running tests
    vim.keymap.set('n', '<leader>tc', function()
      neotest.run.run()
      neotest.summary.open()
    end, { desc = 'Run test under cursor' })

    vim.keymap.set('n', '<leader>tb', function()
      neotest.run.run(vim.fn.expand '%')
      neotest.summary.open()
    end, { desc = 'Run all tests in current buffer' })

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
