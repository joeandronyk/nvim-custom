return {
  {
    '0xJohnnyboy/scretch.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    -- or
    -- requires = 'ibhagwan/fzf-lua' ,
    config = function()
      local scretch = require 'scretch'

      vim.keymap.set('n', '<leader>sn', scretch.new, { desc = 'New Scratch' })
      vim.keymap.set('n', '<leader>snn', scretch.new_named, { desc = 'New Named Scratch' })
      vim.keymap.set('n', '<leader>sl', scretch.last, { desc = 'Last Scratch' })
      vim.keymap.set('n', '<leader>ss', scretch.search, { desc = 'Search Scratches' })
      vim.keymap.set('n', '<leader>sg', scretch.grep, { desc = 'Gret Scratches' })
      vim.keymap.set('n', '<leader>sv', scretch.explore, { desc = 'Explore Scratches' })

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
