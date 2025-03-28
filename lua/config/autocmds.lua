-- [[AutoLoad Session in Persistence]]
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Auto load Persistence session',
  group = vim.api.nvim_create_augroup('persistence_group', { clear = true }),
  callback = function()
    require('persistence').load()
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

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
