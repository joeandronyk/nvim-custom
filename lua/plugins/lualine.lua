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
        -- component_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
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
        lualine_b = { { 'branch', color = { bg = '#39496c', fg = '#b8c1d0' }, separator = { left = '', right = '' } } },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype' },
        lualine_y = {
          {
            'env_var',
            -- color = { bg = '#b8c1d0', fg = '#39496c' },
            color = { bg = '#39496c', fg = '#b8c1d0' },
            fmt = function()
              local virtual_env = os.getenv 'VIRTUAL_ENV'
              if virtual_env then
                local cleaned_virtual_env = virtual_env:gsub('\\', '/')
                local project_root = vim.fn.getcwd():gsub('\\', '/')
                local relative_path = cleaned_virtual_env:gsub('^' .. project_root .. '/', '')
                return relative_path:match '.*/(.+)' or relative_path -- Extract the .env folder name
              else
                return ''
              end
            end,
            separator = { left = '', right = '' },
          },
        },
        lualine_z = {
          { 'progress', color = { bg = '#506799', fg = '#c3ccdc' } },
          { 'location', separator = { left = '', right = '' } },
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
