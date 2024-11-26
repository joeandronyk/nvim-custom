return {
  'j-morano/buffer_manager.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  keys = {
    {
      '<leader>bb',
      function()
        require('buffer_manager.ui').toggle_quick_menu()
      end,
      desc = 'Open Buffer Manager',
    },
  },
  config = function()
    require('buffer_manager').setup {
      line_keys = '1234567890',
      select_menu_item_commands = {
        edit = {
          key = '<CR>',
          command = 'edit',
        },
      },
      focus_alternate_buffer = false,
      short_file_names = false,
      short_term_names = false,
      loop_nav = true,
      width = 0.55,
      highlight = '',
      win_extra_options = {},
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      format_function = nil,
      order_buffers = nil,
      show_indicators = nil,
    }
  end,
}
