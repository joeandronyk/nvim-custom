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
    local dap = require 'dap'
    dap.adapters.debugpy = function(cb, config)
    if config.request == 'attach' then
      ---@diagnostic disable-next-line: undefined-field
      local port = (config.connect or config).port
      ---@diagnostic disable-next-line: undefined-field
      local host = (config.connect or config).host or '127.0.0.1'

      cb {
        type = "executable",  -- this normally is 'server', but overrode it to work with maya.
        port = assert(port, "`connect.port` is required for a python `attach` configuration"),
        host = host,
        options = {
          source_filetype = "python",
        },
        command = require('venv-selector').python(),
        args = { "-m", "debugpy.adapter" },
      }
      else
        cb {
          type = 'executable',
          command = require('venv-selector').python(),
          args = { '-m', 'debugpy.adapter' },
          options = {
            source_filetype = 'python',
          },
        }
      end
    end

    table.insert(require('dap').configurations.python, {
      type = 'debugpy',
      request = 'attach',
      pythonPath = require('venv-selector').python(),
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
      console = 'nil',
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
