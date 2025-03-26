-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set('i', 'jj', '<ESC>', { silent = true })
vim.keymap.set('i', '<C-v>', '<C-r>+', { silent = true })

-- Disable the default 'q' key for macro recording
-- Map 'Q' to start and stop macro recording
vim.api.nvim_set_keymap('n', 'q', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', 'q', { noremap = true, silent = true })

-- Keymap to switch to the previous buffer
vim.api.nvim_set_keymap('n', '<leader>bb', ':b#<CR>', { noremap = true, silent = true })

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

--  Use CTRL+<hjkl> to switch between windows
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

-- [[ Extra ]]
vim.keymap.set('n', '<leader>pr', '<CMD> :sp <bar> :term python % <CR>', { desc = 'Run current buffer in python terminal' })
-- vim.keymap.set('n', '<leader>pa', '<CMD> :sp <bar> :term hatch run app <CR>', { desc = 'Run App' })
vim.keymap.set('n', '<leader>e', '<CMD>:!start explorer /select,%:p<CR>', { desc = 'Open In Explorer' })
-- nnoremap <C-W> :bd!<CR>)
-- vim: ts=2 sts=2 sw=2 et
--
-- [[ Remove Mappings ]]
vim.keymap.set('n', 's', '<nop>')

-- Set makeprg to run pre-commit
vim.opt.makeprg = 'pre-commit run --all-files'

-- Create a keybinding to run :make and open the quickfix list
vim.api.nvim_set_keymap('n', '<leader>pc', ':make<CR>:copen<CR>', { noremap = true, silent = true })

-- Old way of running Autopilot
-- vim.keymap.set('n', '<leader>pa', '<CMD> :lua Snacks.terminal("python -c "from autopilot.app import main; main()"") <CR>', { desc = 'Run Autopilot' })
-- New way with snacks, much faster and the window closes after
vim.keymap.set('n', '<leader>pa', '<CMD>lua Snacks.terminal("python -c \\"from autopilot.app import main; main()\\"")<CR>', { desc = 'Run Autopilot' })
