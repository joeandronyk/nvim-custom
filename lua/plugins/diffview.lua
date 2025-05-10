return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup()

    -- Toggle Diffview
    function _G.toggle_diffview()
      local lib = require 'diffview.lib'
      if lib.views[1] then
        vim.cmd 'DiffviewClose'
      else
        vim.cmd 'DiffviewOpen'
      end
    end

    -- Toggle Git File History
    function _G.toggle_diffview_file_history()
      local lib = require 'diffview.lib'
      if lib.views[1] then
        vim.cmd 'DiffviewClose'
      else
        vim.cmd 'DiffviewFileHistory %'
      end
    end

    -- Key mappings
    vim.api.nvim_set_keymap('n', '<leader>gd', ':lua toggle_diffview()<CR>', { noremap = true, silent = true, desc = 'Toggle Diffview' })
    vim.api.nvim_set_keymap(
      'n',
      '<leader>gf',
      ':lua toggle_diffview_file_history()<CR>',
      { noremap = true, silent = true, desc = 'Toggle Diffview File History' }
    )
  end,
}
