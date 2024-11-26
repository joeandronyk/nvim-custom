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
--
-- return {
--   {
--     'catppuccin/nvim',
--     name = 'catppuccin',
--     priority = 1000,
--     opts = {
--       transparent_background = true, -- disables setting the background color.
--       show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--       term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
--       no_italic = false, -- Force no italic
--       no_bold = false, -- Force no bold
--       no_underline = false, -- Force no underline
--       styles = {
--         comments = { 'italic' },
--         functions = { 'bold' },
--         keywords = { 'italic' },
--         operators = { 'bold' },
--         conditionals = { 'bold' },
--         loops = { 'bold' },
--         booleans = { 'bold', 'italic' },
--         numbers = {},
--         types = {},
--         strings = {},
--         variables = {},
--         properties = {},
--       },
--       highlight_overrides = {
--         all = function(colors)
--           return {
--             NvimTreeNormal = { fg = colors.none },
--             CmpBorder = { fg = '#3e4145' },
--           }
--         end,
--         latte = function(latte)
--           return {
--             Normal = { fg = latte.base },
--           }
--         end,
--         frappe = function(frappe)
--           return {
--             ['@comment'] = { fg = frappe.surface2, style = { 'italic' } },
--           }
--         end,
--         macchiato = function(macchiato)
--           return {
--             LineNr = { fg = macchiato.overlay1 },
--           }
--         end,
--         mocha = function(mocha)
--           return {
--             Comment = { fg = mocha.crust },
--           }
--         end,
--       },
--     },
--     config = function(_, opts)
--       require('catppuccin').setup(opts)
--       -- Load the colorscheme here.
--       -- Like many other themes, this one has different styles, and you could load
--       -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--       -- vim.cmd.colorscheme 'catppuccin-latte'
--       -- vim.cmd.colorscheme 'catppuccin-frappe'
--       -- vim.cmd.colorscheme 'catppuccin-macchiato'
--       vim.cmd.colorscheme 'catppuccin-mocha'
--     end,
--   },
-- }

-- return {
--   {
--     'rose-pine/neovim',
--     name = 'rose-pine',
--     priority = 1000,
--     config = function()
--       require('rose-pine').setup {
--         variant = 'auto', -- auto, main, moon, or dawn
--         dark_variant = 'main', -- main, moon, or dawn
--         dim_inactive_windows = false,
--         extend_background_behind_borders = true,
--
--         enable = {
--           terminal = true,
--           legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--           migrations = true, -- Handle deprecated options automatically
--         },
--
--         styles = {
--           bold = false,
--           italic = true,
--           transparency = true,
--         },
--
--         groups = {
--           border = 'muted',
--           link = 'iris',
--           panel = 'surface',
--
--           error = 'love',
--           hint = 'iris',
--           info = 'foam',
--           note = 'pine',
--           todo = 'rose',
--           warn = 'gold',
--
--           git_add = 'foam',
--           git_change = 'rose',
--           git_delete = 'love',
--           git_dirty = 'rose',
--           git_ignore = 'muted',
--           git_merge = 'iris',
--           git_rename = 'pine',
--           git_stage = 'iris',
--           git_text = 'rose',
--           git_untracked = 'subtle',
--
--           h1 = 'iris',
--           h2 = 'foam',
--           h3 = 'rose',
--           h4 = 'gold',
--           h5 = 'pine',
--           h6 = 'foam',
--         },
--
--         pallete = {
--           -- Override the builtin palette per variant
--           -- moon = {
--           --     base = '#18191a',
--           --     overlay = '#363738',
--           -- },
--         },
--
--         highlight_groups = {
--           -- Comment = { fg = "foam" },
--           -- VertSplit = { fg = "muted", bg = "muted" },
--         },
--
--         before_highlight = function(group, highlight, palette)
--           -- Disable all undercurls
--           -- if highlight.undercurl then
--           --     highlight.undercurl = false
--           -- end
--           --
--           -- Change palette colour
--           -- if highlight.fg == palette.pine then
--           --     highlight.fg = palette.foam
--           -- end
--         end,
--       }
--
--       -- vim.cmd 'colorscheme rose-pine'
--       -- vim.cmd 'colorscheme rose-pine-main'
--       -- vim.cmd 'colorscheme rose-pine-moon'
--       vim.cmd 'colorscheme rose-pine-dawn'
--     end,
--   },
-- }

return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- do not set background color
        globalStatus = true,
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
          theme = {
            dragon = {
              syn = {
                comment = '#16161D',
                string = '#16161D',
              },
            },
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = 'none' },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = 'none' },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = 'none' },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = 'none' },
            TelescopePreviewNormal = { bg = 'none' },
            TelescopePreviewBorder = { fg = theme.ui.bg_dim, bg = 'none' },
            NormalFloat = { bg = 'none' },
            FloatTitle = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            LazyNormal = { bg = 'none', fg = theme.ui.fg_dim },
            MasonNormal = { bg = 'none', fg = theme.ui.fg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = 'none', blend = vim.o.pumblend },
            PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            CursorLine = { bg = '#282c41', fg = '#acb4c2' }, -- match lualine's nightfly theme
            -- TroubleNormal = { link = 'NormalDark' },
            -- TroubleNormalNC = { link = 'TroubleNormal' },
            -- NeoTreeNormal = { link = 'NormalDark' },
            -- DiagnosticVirtualTextError = {
            --   fg = theme.diag.error,
            --   bg = c(theme.diag.error):blend(theme.ui.bg, 0.95):to_hex(),
            -- },
            -- DiagnosticVirtualTextWarn = {
            --   fg = theme.diag.warning,
            --   bg = c(theme.diag.warning):blend(theme.ui.bg, 0.95):to_hex(),
            -- },
            -- DiagnosticVirtualTextHint = {
            --   fg = theme.diag.hint,
            --   bg = c(theme.diag.hint):blend(theme.ui.bg, 0.95):to_hex(),
            -- },
            -- DiagnosticVirtualTextInfo = {
            --   fg = theme.diag.info,
            --   bg = c(theme.diag.info):blend(theme.ui.bg, 0.95):to_hex(),
            -- },
            -- DiagnosticVirtualTextOk = {
            --   fg = theme.diag.ok,
            --   bg = c(theme.diag.ok):blend(theme.ui.bg, 0.95):to_hex(),
            -- },
          }
        end,
        theme = 'wave', -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = 'dragon', -- try "dragon" !
          light = 'lotus',
        },
      }
      -- setup must be called before loading
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
}

-- return {
--   {
--     'ellisonleao/gruvbox.nvim',
--     priority = 1000,
--     -- 'LazyVim/LazyVim',
--     -- opts = {
--     --   colorscheme = 'gruvbox',
--     --   background = 'dark',
--     -- },
--     config = function()
--       require('gruvbox').setup {
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
--         inverse = false, -- invert background for search, diffs, statuslines and errors
--         contrast = 'soft', -- can be "hard", "soft" or empty string
--         palette_overrides = {},
--         overrides = {},
--         dim_inactive = false,
--         transparent_mode = true,
--       }
--       vim.cmd.colorscheme 'gruvbox'
--     end,
--   },
-- }

-- return {
--   { 'ellisonleao/gruvbox.nvim', priority = 1000 },
--   {
--     'LazyVim/LazyVim',
--     opts = {
--       colorscheme = 'gruvbox',
--       background = 'dark',
--     },
--     config = function()
--       require('gruvbox').setup {
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
--         inverse = false, -- invert background for search, diffs, statuslines and errors
--         contrast = 'soft', -- can be "hard", "soft" or empty string
--         palette_overrides = {},
--         overrides = {},
--         dim_inactive = false,
--         transparent_mode = true,
--       }
--     end,
--   },
-- }
-- return {
--   'mellow-theme/mellow.nvim',
--   config = function()
--     vim.g.mellow_italic_comments = true
--     vim.g.mellow_bold_functions = true
--     vim.g.italic_booleans = true
--     vim.g.mellow_transparent = true
--   end,
-- }
