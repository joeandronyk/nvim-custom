return {
  'MagicDuck/grug-far.nvim',

  vim.keymap.set('n', '<leader>fr', ':GrugFar<CR>', { desc = 'Find and Replace' }),

  config = function()
    require('grug-far').setup {
      -- options, see Configuration section below
      -- there are no required options atm
      -- engine = 'ripgrep' is default, but 'astgrep' can be specified
    }
  end,
}
