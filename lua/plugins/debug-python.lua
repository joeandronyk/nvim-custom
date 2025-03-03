return {
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  lazy = true,
  enabled = true,
  dependencies = { 'mfussenegger/nvim-dap' },
  keys = {
    { '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", mode = 'n', desc = 'Add Breakpoint' },
  },
  config = function()
    -- The python path needs to be an absolute path.  Here we hijack venv-selection
    -- to update the python path in dap-python.
    local path = require 'venv-selector.path'
    path.update_python_dap = function()
      local dap_python_installed, dap_python = pcall(require, 'dap-python')
      local dap_installed, dap = pcall(require, 'dap')
      if dap_python_installed and dap_installed then
        local python_path = require('venv-selector').python()
        require('dap-python').setup(python_path)
        print("Setting dap python interpreter to '" .. python_path .. "'")
      else
        log.debug 'Debugger not enabled: dap or dap-python not installed.'
      end
    end

    table.insert(require('dap').configurations.python, {
      type = 'debugpy',
      request = 'attach',
      pythonPath = python_path,
      -- request = 'launch',
      name = 'My Python Debugger: Attach using Process Id',
      processId = require('dap.utils').pick_process,
      justMyCode = true,
      host = '127.0.0.1',
      port = '5678',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      redirectOutput = false,
      logToFile = true,
      sourceMaps = true,
      timeout = 50000,
      initialize_timeout_sec = 100,
      console = 'integratedTerminal',
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
