return {
  {
    '0xJohnnyboy/scretch.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    -- or
    -- requires = 'ibhagwan/fzf-lua' ,
    config = function()
      local scretch = require 'scretch'

      vim.keymap.set('n', '<leader>un', scretch.new)
      vim.keymap.set('n', '<leader>unn', scretch.new_named)
      vim.keymap.set('n', '<leader>uft', scretch.new_from_template)
      vim.keymap.set('n', '<leader>ul', scretch.last)
      vim.keymap.set('n', '<leader>us', scretch.search)
      vim.keymap.set('n', '<leader>ut', scretch.edit_template)
      vim.keymap.set('n', '<leader>ug', scretch.grep)
      vim.keymap.set('n', '<leader>uv', scretch.explore)
      vim.keymap.set('n', '<leader>uat', scretch.save_as_template)

      require('scretch').setup {
        scretch_dir = vim.fn.stdpath 'config' .. '/scretch/', -- will be created if it doesn't exist
        templte_dir = vim.fn.stdpath 'data' .. '/scretch/templates', -- will be created if it doesn't exist
        default_name = 'scretch_',
        default_type = 'txt', -- default unnamed Scretches are named "scretch_*.txt"
        split_cmd = 'vsplit', -- vim split command used when creating a new Scretch
        backend = 'telescope.builtin', -- also accpets "fzf-lua"
      }
    end,
  },
}
