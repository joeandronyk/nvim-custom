return {
  'MagicDuck/grug-far.nvim',

  vim.keymap.set('n', '<leader>fr', ':GrugFar<CR>', { desc = 'Find and Replace' }),

  config = function()
    require 'grug-far'.setup {
      engines = {
        ripgrep = {
          extraArgs =
              '--no-heading -.ni --path-separator=/'
              .. ' -g !.git'
              .. ' -g !.github'
              .. ' -g !*cache'
              .. ' -g !bin'
              .. ' -g !out'
              .. ' -g !build'
              .. ' -g !target'
              .. ' -g !vendor'
              .. ' -g !dist'
              .. ' -g !node_modules'
        },
      },
      windowCreationCommand = 'vert topleft split',
      wrap = false,
    }
  end,
}
