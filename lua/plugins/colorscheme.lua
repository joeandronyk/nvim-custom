return {

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    enabled = false,
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    enabled = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { 'italic' }, -- Change the style of comments
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      }
      -- vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'auto', -- auto, main, moon, or dawn
        dark_variant = 'main', -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
          migrations = true, -- Handle deprecated options automatically
        },

        styles = {
          bold = false,
          italic = true,
          transparency = true,
        },

        groups = {
          border = 'muted',
          link = 'iris',
          panel = 'surface',

          error = 'love',
          hint = 'iris',
          info = 'foam',
          note = 'pine',
          todo = 'rose',
          warn = 'gold',

          git_add = 'foam',
          git_change = 'rose',
          git_delete = 'love',
          git_dirty = 'rose',
          git_ignore = 'muted',
          git_merge = 'iris',
          git_rename = 'pine',
          git_stage = 'iris',
          git_text = 'rose',
          git_untracked = 'subtle',

          h1 = 'iris',
          h2 = 'foam',
          h3 = 'rose',
          h4 = 'gold',
          h5 = 'pine',
          h6 = 'foam',
        },

        pallete = {
          -- Override the builtin palette per variant
          -- moon = {
          --     base = '#18191a',
          --     overlay = '#363738',
          -- },
        },

        highlight_groups = {
          -- Comment = { fg = "foam" },
          -- VertSplit = { fg = "muted", bg = "muted" },
        },

        before_highlight = function(group, highlight, palette)
          -- Disable all undercurls
          -- if highlight.undercurl then
          --     highlight.undercurl = false
          -- end
          --
          -- Change palette colour
          -- if highlight.fg == palette.pine then
          --     highlight.fg = palette.foam
          -- end
        end,
      }

      -- vim.cmd 'colorscheme rose-pine'
      -- vim.cmd 'colorscheme rose-pine-main'
      -- vim.cmd 'colorscheme rose-pine-moon'
      -- vim.cmd 'colorscheme rose-pine-dawn'
    end,
  },

  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        theme = 'wave', -- Load "wave" theme
        background = 'dark', -- or 'light' for light mode
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = { bold = false },
        transparent = true, -- do not set background color
        globalStatus = true,
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
                bg_m3 = '#2c3043', -- match lualine
                fg = '#c0c2d4', -- variable names
              },
              -- diff = {
              --   add = '#a490ba',
              --   delete = '#b08b9f',
              --   change = '#b299a7',
              --   text = '#c0c2d4',
              -- },
              syn = {
                string = '#88c8a2', -- done
                number = '#aaabb8', -- done
                constant = '#caa18d', -- done bools
                -- identifier = '#bcbfd0', -- done
                identifier = '#9799cf', -- done
                parameter = '#d2978a', -- done

                fun = '#7a97c6', -- done
                statement = '#aaabb8', -- anchors and aliases in yaml
                keyword = '#a490ba', -- done keyword class, lambda etc
                operator = '#5eaeb0', -- done = sign
                preproc = '#b08b9f', -- done import, from
                -- type = '#858fae', -- done modules
                type = '#b2bbcf', -- done modules
                regex = '#545565',
                deprecated = '#545565',
                comment = '#545565', -- done
                punct = '#6d6c7a', -- done
                -- special = '#545565',
                -- special1 = '#c19380', -- require statement, class
                special1 = '#C0A36E', -- require statement, class
                special2 = '#c58c80', -- done self
                special3 = '#c58c80', -- done return
                -- delimiter = '#545565',
                -- typedef = '#545565',
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          return {
            NormalFloat = { bg = 'none' },
            FloatTitle = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            LazyNormal = { bg = 'none', fg = theme.ui.fg_dim },
            MasonNormal = { bg = 'none', fg = theme.ui.fg_dim },
            Pmenu = { fg = theme.ui.shade0, bg = 'none', blend = vim.o.pumblend },
            PmenuSel = { fg = 'none', bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },

            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            CursorLine = { bg = '#2c3043', fg = '#acb4c2' }, -- match lualine's nightfly theme

            -- Mini.Statusline Overrides
            -- MiniStatuslineModeNormal = { fg = '#092236', bg = '#82aaff' },
            -- MiniStatuslineDevinfo = { fg = '#c3ccdc', bg = '#2c3043' },
            -- MiniStatuslineFilename = { fg = '#c3ccdc', bg = '#2c3043' },
            -- MiniStatuslineFileinfo = { fg = '#c3ccdc', bg = '#2c3043' },
            -- MiniStatuslineModeInsert = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            -- MiniStatuslineModeVisual = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            -- * `MiniStatuslineModeVisual` - Visual mode.
            -- * `MiniStatuslineModeReplace` - Replace mode.
            -- * `MiniStatuslineModeCommand` - Command mode.
            -- * `MiniStatuslineModeOther` - other modes (like Terminal, etc.).
            --
            -- Highlight used in default statusline:
            -- * `MiniStatuslineDevinfo` - for "dev info" group
            --   (|MiniStatusline.section_git| and |MiniStatusline.section_diagnostics|).
            -- * `MiniStatuslineFilename` - for |MiniStatusline.section_filename| section.
            -- * `MiniStatuslineFileinfo` - for |MiniStatusline.section_fileinfo| section.
            --
            -- Other groups:
            -- * `MiniStatuslineInactive` - highliting in not focused window.
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
        -- theme = 'dragon', -- Load "wave" theme when 'background' option is not set
        -- background = { -- map the value of 'background' option to a theme
        --   dark = 'dragon', -- try "dragon" !
        --   light = 'lotus',
        -- },
      }
      -- setup must be called before loading
      vim.cmd 'colorscheme kanagawa-wave'
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    enabled = false,
    -- 'LazyVim/LazyVim',
    -- opts = {
    --   colorscheme = 'gruvbox',
    --   background = 'dark',
    -- },
    config = function()
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false, -- invert background for search, diffs, statuslines and errors
        contrast = 'soft', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      }
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    enabled = false,
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'gruvbox',
      background = 'dark',
    },
    config = function()
      require('gruvbox').setup {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false, -- invert background for search, diffs, statuslines and errors
        contrast = 'soft', -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      }
    end,
  },

  {
    'mellow-theme/mellow.nvim',
    enabled = false,
    config = function()
      vim.g.mellow_italic_comments = true
      vim.g.mellow_bold_functions = true
      vim.g.italic_booleans = true
      vim.g.mellow_transparent = true
    end,
  },
}
