return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  priority = 1000,
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'nightfly',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = {
          'location',
          {
            'env_var',
            fmt = function()
              local virtual_env = os.getenv 'VIRTUAL_ENV'
              print(virtual_env)
              print(vim.fn.getcwd())
              if virtual_env then
                local cleaned_virtual_env = virtual_env:gsub('\\', '/')
                return cleaned_virtual_env:gsub('^' .. vim.fn.getcwd() .. '/', '')
              else
                return ''
              end
            end,
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        -- lualine_a = { 'buffers' },
        -- lualine_b = { 'branch' },
        -- lualine_c = { 'filename' },
        -- lualine_x = {},
        -- lualine_y = {},
        -- lualine_z = { 'tabs' },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
