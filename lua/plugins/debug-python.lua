return {
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  -- event = 'VeryLazy',
  lazy = true,
  dependencies = { 'mfussenegger/nvim-dap' },
  keys = {
    { '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", mode = 'n', desc = 'Add Breakpoint' },
  },
  config = function()
    require('dap-python').setup 'python'

    table.insert(require('dap').configurations.python, {
      type = 'debugpy',
      request = 'attach',
      name = 'My Python Debugger: Attach using Process Id',
      processId = require('dap.utils').pick_process,
      justMyCode = true,
      -- host = "127.0.0.1",
      port = '5678',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      redirectOutput = false,
      logToFile = true,
      -- sourceMaps = true,
    })

    table.insert(require('dap').configurations.python, {
      -- The first three options are required by nvim-dap
      type = 'python',
      request = 'launch',
      name = 'Python3: Launch file',
      program = '${file}',
      pythonPath = require('venv-selector').venv(),
      redirectOutput = false,
      console = 'integratedTerminal',
    })
  end,
}
