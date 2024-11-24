return {
  'okuuva/auto-save.nvim',
  version = '^1.0.0', -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
  cmd = 'ASToggle', -- optional for lazy loading on command
  event = { 'InsertLeave', 'TextChanged' }, -- optional for lazy loading on trigger events

  vim.api.nvim_set_keymap('n', '<leader>a', ':ASToggle<CR>', { desc = 'Toggle AutoSave' }),
  config = function()
    require('auto-save').setup {
      enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
      -- execution_message = {
      --   message = function() -- message to print on save
      --     -- return ''
      --     return ('AutoSave: saved at ' .. vim.fn.strftime '%H:%M:%S')
      --   end,
      --   dim = 0.18, -- dim the color of `message`
      --   cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
      -- },
      trigger_events = { -- See :h events
        immediate_save = { 'BufLeave', 'FocusLost' }, -- vim events that trigger an immediate save
        defer_save = { 'InsertLeave', 'TextChanged' }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
        cancel_deferred_save = { 'InsertEnter' }, -- vim events that cancel a pending deferred save
      },
      -- function that takes the buffer handle and determines whether to save the current buffer or not
      -- return true: if buffer is ok to be saved
      -- return false: if it's not ok to be saved
      -- if set to `nil` then no specific condition is applied
      write_all_buffers = false, -- write all buffers when the current one meets `condition`
      noautocmd = true, -- do not execute autocmds when saving
      lockmarks = false, -- lock marks when saving, see `:h lockmarks` for more details
      debounce_delay = 1000, -- delay after which a pending save is executed
      -- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
      debug = false,
      condition = function(buf)
        local fn = vim.fn
        local utils = require 'auto-save.utils.data'

        if fn.getbufvar(buf, '&filetype') == 'harpoon' then
          return false
        end
        if fn.getbufvar(buf, '&modifiable') == 1 and utils.not_in(fn.getbufvar(buf, '&filetype'), {}) then
          return true -- met condition(s), can save
        end
        return false -- can't save
      end,
    }
  end,
}
