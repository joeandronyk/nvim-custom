return {
  'gbprod/yanky.nvim',
  dependencies = {
    { 'kkharji/sqlite.lua' },
  },
  enabled = true,
  opts = {
    ring = { storage = 'sqlite' },
  },
  keys = {
    -- {
    --   '<leader>p',
    --   function()
    --     require('telescope').extensions.yank_history.yank_history {}
    --   end,
    --   desc = 'Open Yank History',
    -- },
    { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
    -- { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after selection' },
    -- { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before selection' },
    -- { '<c-p>', '<Plug>(YankyPreviousEntry)', desc = 'Select previous entry through yank history' },
    -- { '<c-n>', '<Plug>(YankyNextEntry)', desc = 'Select next entry through yank history' },
    -- { ']p', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
    -- { '[p', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
    -- { ']P', '<Plug>(YankyPutIndentAfterLinewise)', desc = 'Put indented after cursor (linewise)' },
    -- { '[P', '<Plug>(YankyPutIndentBeforeLinewise)', desc = 'Put indented before cursor (linewise)' },
    -- { '>p', '<Plug>(YankyPutIndentAfterShiftRight)', desc = 'Put and indent right' },
    -- { '<p', '<Plug>(YankyPutIndentAfterShiftLeft)', desc = 'Put and indent left' },
    -- { '>P', '<Plug>(YankyPutIndentBeforeShiftRight)', desc = 'Put before and indent right' },
    -- { '<P', '<Plug>(YankyPutIndentBeforeShiftLeft)', desc = 'Put before and indent left' },
    -- { '=p', '<Plug>(YankyPutAfterFilter)', desc = 'Put after applying a filter' },
    -- { '=P', '<Plug>(YankyPutBeforeFilter)', desc = 'Put before applying a filter' },
  },
  config = function()
    require('yanky').setup {
      ring = {
        history_length = 20,
        storage = 'shada',
        sync_with_numbered_registers = true,
        cancel_event = 'update',
        ignore_registers = { '_', '.', ':' },
        update_register_on_cycle = false,
        permanent_wrapper = nil,
      },
      system_clipboard = {
        sync_with_ring = true,
      },
      highlight = {
        on_put = false,
        on_yank = false,
        timer = 500,
      },
      preserve_cursor_position = {
        enabled = true,
      },
      -- textobj = {
      --   enabled = false,
      -- },
    }
  end,
}
