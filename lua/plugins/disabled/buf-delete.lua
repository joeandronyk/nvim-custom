return {
  {
    'famiu/bufdelete.nvim',
    vim.keymap.set('n', '<leader>bd', ':Bdelete<CR>', { desc = 'Delete Buffer' }),
  },
}
