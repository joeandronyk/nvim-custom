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
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = 'mini', -- default view for messages
        view_error = 'mini', -- view for errors
        view_warn = 'mini', -- view for warnings
        view_history = 'messages', -- view for :messages
        view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
      },
    }
  end,
}
