return {
  'mgierada/lazydocker.nvim',
  dependencies = { 'akinsho/toggleterm.nvim' },
  config = function()
    require('lazydocker').setup {}
  end,
  lazy = true,
  -- event = 'BufRead',
  keys = {
    {
      '<leader>ld',
      function()
        require('lazydocker').open()
      end,
      desc = 'Open Lazydocker floating window',
    },
  },
}
