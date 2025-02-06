return {
  'LintaoAmons/scratch.nvim',
  event = 'VeryLazy',
  dependencies = {
    { 'ibhagwan/fzf-lua' }, --optional: if you want to use fzf-lua to pick scratch file. Recommanded, since it will order the files by modification datetime desc. (require rg)
    -- { 'nvim-telescope/telescope.nvim' }, -- optional: if you want to pick scratch file by telescope
    { 'stevearc/dressing.nvim' }, -- optional: to have the same UI shown in the GIF
  },
  vim.keymap.set('n', '<leader>sn', '<cmd>Scratch<cr>', { desc = 'New Scratch File' }),
  vim.keymap.set('n', '<leader>so', '<cmd>ScratchOpen<cr>', { desc = 'Open Scratch File' }),
  config = function()
    require('scratch').setup {
      scratch_file_dir = vim.fn.stdpath 'cache' .. '/scratch.nvim', -- where your scratch files will be put
      window_cmd = 'vsplit', -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
      use_telescope = false,
      -- fzf-lua is recommanded, since it will order the files by modification datetime desc. (require rg)
      file_picker = nil, -- "fzflua" | "telescope" | nil
      filetypes = { 'lua', 'sh', 'py', 'md' }, -- you can simply put filetype here
      filetype_details = { -- or, you can have more control here
        json = {}, -- empty table is fine
        ['md'] = {
          subdir = 'project-name', -- group scratch files under specific sub folder
        },
        ['yaml'] = {},
        ['py'] = {},
      },
      localKeys = {
        -- {
        --   filenameContains = { 'sh' },
        --   LocalKeys = {
        --     {
        --       cmd = '<CMD>RunShellCurrentLine<CR>',
        --       key = '<C-r>',
        --       modes = { 'n', 'i', 'v' },
        --     },
        --   },
        -- },
        {
          filenameContains = { 'py' },
          LocalKeys = {
            {
              cmd = '<CMD>:sp <bar> :term python % <CR>',
              key = '<C-r>',
              modes = { 'n', 'i', 'v' },
            },
          },
        },
      },
      hooks = {},
    }
  end,
}
