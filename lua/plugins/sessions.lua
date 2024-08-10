return {
  'natecraddock/sessions.nvim',
  config = function()
    require('sessions').setup {
      events = { 'BufEnter' },
      session_filepath = '../nvim/session',
    }
  end,
}
