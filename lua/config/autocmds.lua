-- [[Macro Recording Feedback]]
vim.api.nvim_create_autocmd('RecordingEnter', {
  callback = function()
    vim.notify('Recording macro...', vim.log.levels.INFO)
  end,
})

vim.api.nvim_create_autocmd('RecordingLeave', {
  callback = function()
    vim.notify('Stopped recording macro.', vim.log.levels.INFO)
  end,
})

-- [[AutoLoad Session in Persistence]]
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Auto load Persistence session',
  group = vim.api.nvim_create_augroup('persistence_group', { clear = true }),
  callback = function()
    require('persistence').load()
  end,
})

-- [[Attach Gitsigns after Persistence loads buffers]]
vim.api.nvim_create_autocmd('User', {
  -- The pattern makes it so that it only runs after the Persistence plugin has loaded buffers
  pattern = 'PersistenceLoadPost',
  group = vim.api.nvim_create_augroup('UserGitSigns', { clear = true }),
  callback = function()
    local gitsigns = require 'gitsigns'
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) then
        gitsigns.attach(buf) -- Attach Gitsigns to restored buffers
      end
    end
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[RuffCheck command]]
vim.api.nvim_create_user_command('RuffCheck', function()
  -- Run Ruff and capture the output
  local output = vim.fn.systemlist 'ruff check .'

  vim.fn.setqflist({}, 'r')
  for _, line in ipairs(output) do
    local filename, lnum, col, text = string.match(line, '([^:]+):(%d+):(%d+): (.+)')
    if filename and lnum and col and text then
      vim.fn.setqflist({
        {
          filename = filename,
          lnum = tonumber(lnum),
          col = tonumber(col),
          text = text,
        },
      }, 'a')
    end
  end
  vim.cmd 'copen' -- Open the quickfix list
end, {})

vim.api.nvim_set_keymap('n', '<leader>rc', ':RuffCheck<CR>', { noremap = true, silent = true })
