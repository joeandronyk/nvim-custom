-- [[ Setting options ]]
-- See `:help vim.opt`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 4 -- Number of spaces a tab represents
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true -- Automatically indent new lines
vim.opt.wrap = true -- Enable line wrapping
vim.opt.termguicolors = true -- Enable 24-bit RGB colors-

vim.opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits!

-- code folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:►]]

-- Don't show the mode, since it's already in the status line
-- vim.opt.showmode = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default

vim.opt.updatetime = 250 -- Decrease update time

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!

vim.opt.cursorline = true -- Show which line your cursor is on

vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.

vim.opt.swapfile = false
vim.opt.undofile = true -- Save undo history
vim.opt.shadafile = 'NONE'

-- Change the windows terminal tab name to be the cwd.  The double backslash
-- is for windows.  On linux we would need to use a forward slash.
vim.opt.title = true
vim.opt.titlestring = [[%{substitute(getcwd(),'^.*\\','','')}]]

vim.o.sessionoptions = 'buffers,curdir,folds,help,tabpages,winsize,winpos,localoptions'
-- vim.o.shell = 'pwsh.exe'
-- vim: ts=2 sts=2 sw=2 et
