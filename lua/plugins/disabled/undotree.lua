return {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  event = 'VeryLazy',
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", desc = 'Undo Tree' },
  },
  config = function()
    require('undotree').setup {
      float_diff = true, -- using float window previews diff, set this `true` will disable layout option
      layout = 'left_bottom', -- "left_bottom", "left_left_bottom"
      position = 'left', -- "right", "bottom"
      ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'spectre_panel', 'tsplayground' },
      window = {
        winblend = 0,
      },
      keymaps = {
        ['j'] = 'move_next',
        ['k'] = 'move_prev',
        ['gj'] = 'move2parent',
        ['J'] = 'move_change_next',
        ['K'] = 'move_change_prev',
        ['<cr>'] = 'action_enter',
        ['p'] = 'enter_diffbuf',
        ['q'] = 'quit',
      },
    }
  end,
}
