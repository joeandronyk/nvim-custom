return {
  'ThePrimeagen/harpoon',
  lazy = false,
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()

    local wk = require 'which-key'
    wk.add {
      -- { '<leader>h', group = 'Harpoon' },
      {
        '<leader>hw',
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Show Harpoon UI',
        mode = { 'n' },
      },
      {
        '<leader>ha',
        function()
          harpoon:list():add()
        end,
        desc = 'Add Mark',
        mode = { 'n' },
      },
      {
        '<leader>h1',
        function()
          harpoon:list():select(1)
        end,
        desc = 'Select First Buffer',
        mode = { 'n' },
      },
      {
        '<leader>h2',
        function()
          harpoon:list():select(2)
        end,
        desc = 'Select Second Buffer',
        mode = { 'n' },
      },
      {
        '<leader>h3',
        function()
          harpoon:list():select(3)
        end,
        desc = 'Select Third Buffer',
        mode = { 'n' },
      },
      {
        '<leader>h4',
        function()
          harpoon:list():select(4)
        end,
        desc = 'Select Fourth Buffer',
        mode = { 'n' },
      },
      {
        '<leader>hp',
        function()
          harpoon:list():prev()
        end,
        desc = 'Select Previous',
        mode = { 'n' },
      },
      {
        '<leader>hn',
        function()
          harpoon:list():next()
        end,
        desc = 'Select Next',
        mode = { 'n' },
      },
    }
  end,
  dependencies = { 'nvim-lua/plenary.nvim' },
}
