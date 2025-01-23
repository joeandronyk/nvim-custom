return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/neotest-python',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('neotest').setup {
      log_level = vim.log.levels.INFO,
      adapters = {
        require 'neotest-python' {
          -- args = { '--log-level', 'DEBUG' },
          runner = 'pytest',
          python = '.venv/Scripts/python.exe',
        },
      },
    }
  end,
}
