-- return {
--   { -- You can easily change to a different colorscheme.
--     -- Change the name of the colorscheme plugin below, and then
--     -- change the command in the config to whatever the name of that colorscheme is.
--     --
--     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--     'folke/tokyonight.nvim',
--     priority = 1000, -- Make sure to load this before all the other start plugins.
--     init = function()
--       -- Load the colorscheme here.
--       -- Like many other themes, this one has different styles, and you could load
--       -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--       vim.cmd.colorscheme 'tokyonight-night'
--
--       -- You can configure highlights by doing something like:
--       vim.cmd.hi 'Comment gui=none'
--     end,
--   },
-- }

return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = {
        comments = { 'italic' },
        functions = { 'bold' },
        keywords = { 'italic' },
        operators = { 'bold' },
        conditionals = { 'bold' },
        loops = { 'bold' },
        booleans = { 'bold', 'italic' },
        numbers = {},
        types = {},
        strings = {},
        variables = {},
        properties = {},
      },
      highlight_overrides = {
        all = function(colors)
          return {
            NvimTreeNormal = { fg = colors.none },
            CmpBorder = { fg = '#3e4145' },
          }
        end,
        latte = function(latte)
          return {
            Normal = { fg = latte.base },
          }
        end,
        frappe = function(frappe)
          return {
            ['@comment'] = { fg = frappe.surface2, style = { 'italic' } },
          }
        end,
        macchiato = function(macchiato)
          return {
            LineNr = { fg = macchiato.overlay1 },
          }
        end,
        mocha = function(mocha)
          return {
            Comment = { fg = mocha.crust },
          }
        end,
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'catppuccin-latte'
      -- vim.cmd.colorscheme 'catppuccin-frappe'
      -- vim.cmd.colorscheme 'catppuccin-macchiato'
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}

-- return {
--   { "gbprod/nord.nvim", name = "nord", priority = 1000 },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "nord",
--     },
--   },
-- }

-- return {
--   {
--     'rose-pine/neovim',
--     name = 'rose-pine',
--     priority = 1000,
--     init = function()
--       -- Load the colorscheme here.
--       -- Like many other themes, this one has different styles, and you could load
--       -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--       vim.cmd.colorscheme 'rose-pine'
--
--       -- You can configure highlights by doing something like:
--       vim.cmd.hi 'Comment gui=none'
--     end,
--   },
-- }
--
-- return {
--   { "ellisonleao/gruvbox.nvim", priority = 1000 },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--       background = "light",
--     },
--     config = function()
--       require("gruvbox").setup({
--         terminal_colors = true, -- add neovim terminal colors
--         undercurl = true,
--         underline = true,
--         bold = true,
--         italic = {
--           strings = true,
--           emphasis = true,
--           comments = true,
--           operators = false,
--           folds = true,
--         },
--         strikethrough = true,
--         invert_selection = false,
--         invert_signs = false,
--         invert_tabline = false,
--         invert_intend_guides = false,
--         inverse = true, -- invert background for search, diffs, statuslines and errors
--         contrast = "soft", -- can be "hard", "soft" or empty string
--         palette_overrides = {},
--         overrides = {},
--         dim_inactive = false,
--         transparent_mode = false,
--       })
--     end,
--   },
-- }
--
-- return {
--   { "morhetz/gruvbox", name = "gruvbox", priority = 100 },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }
