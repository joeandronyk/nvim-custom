return {
  -- https://github.com/mfussenegger/nvim-dap-python
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
  },
  keys = {
    { 'n', '<leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = 'toggle_breakpoint' },
  },
  config = function()
    -- Update the path passed to setup to point to your system or virtual env python binary
    require('dap-python').setup '.venv/Scripts/python.exe'
    -- require("dap-python").setup("C:/Program Files/Autodesk/Maya2023/bin/maya.exe")
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
  end,
}
