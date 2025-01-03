-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window Resizing
-- vim.keymap.set('n', '<S-h>', '<CMD>:vertical resize +10<CR>', { desc = 'Open In Explorer' })
-- vim.keymap.set('n', '<S-l>', '<CMD>:vertical resize -10<CR>', { desc = 'Open In Explorer' })
-- vim.keymap.set('n', '<S-j>', '<CMD>:horizontal resize +5<CR>', { desc = 'Open In Explorer' })
-- vim.keymap.set('n', '<S-k>', '<CMD>:horizontal resize -5<CR>', { desc = 'Open In Explorer' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

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

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    local api = require 'nvim-tree.api'
    local view = require 'nvim-tree.view'

    if not view.is_visible() then
      api.tree.open()
    end
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

-- [[ Extra ]]
vim.keymap.set('n', '<leader>pr', '<CMD> :sp <bar> :term python % <CR>', { desc = 'Run current buffer in python terminal' })
vim.keymap.set('n', '<leader>pw', '<CMD> :sp <bar> :term python -m build <CR>', { desc = 'Build Python Wheel' })
vim.keymap.set('n', '<leader>e', '<CMD>:!start explorer /select,%:p<CR>', { desc = 'Open In Explorer' })
-- nnoremap <C-W> :bd!<CR>)
-- vim: ts=2 sts=2 sw=2 et
--
-- [[ Remove Mappings ]]
vim.keymap.set('n', 's', '<nop>')
