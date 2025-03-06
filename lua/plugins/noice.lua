return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>fm',
      '<CMD>Noice history<CR>',
      desc = 'View Messages',
    },
  },
  config = function()
    require('noice').setup {
      lsp = { progress = { enabled = false } },
    }
  end,
}
