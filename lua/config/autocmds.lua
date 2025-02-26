-- [[AutoLoad Session in Persistence]]
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Auto load Persistence session',
  group = vim.api.nvim_create_augroup('persistence_group', { clear = true }),
  callback = function()
    require('persistence').load()
  end,
})

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "PersistenceLoadPre",
--   callback = function()
--     -- Close all buffers
--     vim.cmd("%bd")
--   end,
-- })

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

-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('Auto-Format', { clear = true }),
--   callback = function(args)
--     vim.api.nvim_create_autocmd('BufWritePre', {
--       buffer = args.buf,
--       callback = function()
--         vim.lsp.buf.format { async = false, id = args.data.client_id }
--       end,
--     })
--   end,
-- })

vim.api.nvim_create_user_command('RuffCheck', function()
  -- Run Ruff and capture the output
  local output = vim.fn.systemlist 'ruff check .'

  -- Clear the quickfix list
  vim.fn.setqflist({}, 'r')

  -- Parse the output and add it to the quickfix list
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

  -- Open the quickfix list
  vim.cmd 'copen'
end, {})

vim.api.nvim_set_keymap('n', '<leader>rc', ':RuffCheck<CR>', { noremap = true, silent = true })

-- toggle lazygit
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    local term_title = vim.b.term_title
    if term_title and term_title:match 'lazygit' then
      -- Create lazygit specific mappings
      vim.keymap.set('t', 'q', '<cmd>close<cr>', { buffer = true })
    end
  end,
})
