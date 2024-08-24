return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  version = '*',
  config = function()
    require('toggleterm').setup {
      ConsoleName = '',
      size = 80,
      open_mapping = '<c-t>',
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = false,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = 'pwsh',
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'None',
        },
      },
      autochdir = true,
      terminal_mappings = true,
      persist_mode = false,
      auto_scroll = true,
    }
  end,
}

-- substitute(getcwd(), "^.*\\", "", "")
-- vim.api.nvim_command('set title')
-- vim.api.nvim_command('let &titlestring="My Neovim"')
