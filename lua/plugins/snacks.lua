return {
  'folke/snacks.nvim',
  priority = 1000,
  enabled = true,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    image = { enabled = false },
    terminal = { enabled = true, shell = 'pwsh' },
    dashboard = {
      enabled = false,
      sections = {
        { section = 'header' },
        -- {
        --   pane = 2,
        --   section = 'terminal',
        --   cmd = 'colorscript -e square',
        --   height = 5,
        --   padding = 1,
        -- },
        { section = 'keys', gap = 1, padding = 1 },
        {
          pane = 2,
          icon = ' ',
          desc = 'Browse Repo',
          padding = 1,
          key = 'b',
          action = function()
            Snacks.gitbrowse()
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            -- {
            --   title = 'Notifications',
            --   cmd = 'gh notify -s -a -n5',
            --   action = function()
            --     vim.ui.open 'https://github.com/notifications'
            --   end,
            --   key = 'n',
            --   icon = ' ',
            --   height = 5,
            --   enabled = true,
            -- },
            {
              title = 'Open Issues',
              cmd = 'gh issue list -L 10',
              key = 'i',
              action = function()
                vim.fn.jobstart('gh issue list --web', { detach = true })
              end,
              icon = ' ',
              width = 50,
              height = 15,
            },
            {
              icon = ' ',
              title = 'Open PRs',
              cmd = 'gh pr list -L 3',
              key = 'P',
              action = function()
                vim.fn.jobstart('gh pr list --web', { detach = true })
              end,
              height = 7,
            },
            {
              icon = ' ',
              title = 'Git Status',
              cmd = 'git --no-pager diff --stat -B -M -C',
              height = 15,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend('force', {
              pane = 2,
              section = 'terminal',
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
        { section = 'startup' },
      },
    },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    explorer = {
      enabled = true,
      -- finder = 'explorer',
      -- sort = { fields = { 'sort' } },
      -- supports_live = true,
      -- tree = false,
      -- watch = false,
      -- diagnostics = false,
      -- diagnostics_open = false,
      -- git_status = false,
      -- git_status_open = false,
      -- git_untracked = true,
      -- follow_file = false,
      -- focus = 'list',
      -- auto_close = false,
      -- jump = { close = false },
      -- layout = { preset = 'sidebar', preview = true },
      -- -- to show the explorer to the right, add the below to
      -- -- your config under `opts.picker.sources.explorer`
      -- -- layout = { layout = { position = "right" } },
      -- formatters = {
      --   file = { filename_only = true },
      --   severity = { pos = 'right' },
      -- },
      -- matcher = { sort_empty = false, fuzzy = false },
      -- config = function(opts)
      --   return require('snacks.picker.source.explorer').setup(opts)
      -- end,
      -- win = {
      --   list = {
      --     keys = {
      --       ['<BS>'] = 'explorer_up',
      --       ['l'] = 'confirm',
      --       ['h'] = 'explorer_close', -- close directory
      --       ['a'] = 'explorer_add',
      --       ['d'] = 'explorer_del',
      --       ['r'] = 'explorer_rename',
      --       ['c'] = 'explorer_copy',
      --       ['m'] = 'explorer_move',
      --       ['o'] = 'explorer_open', -- open with system application
      --       ['P'] = 'toggle_preview',
      --       ['y'] = 'explorer_yank',
      --       ['u'] = 'explorer_update',
      --       ['<c-c>'] = 'tcd',
      --       ['<leader>/'] = 'picker_grep',
      --       ['<c-t>'] = 'terminal',
      --       ['.'] = 'explorer_focus',
      --       ['I'] = 'toggle_ignored',
      --       ['H'] = 'toggle_hidden',
      --       ['Z'] = 'explorer_close_all',
      --       [']g'] = 'explorer_git_next',
      --       ['[g'] = 'explorer_git_prev',
      --       [']d'] = 'explorer_diagnostic_next',
      --       ['[d'] = 'explorer_diagnostic_prev',
      --       [']w'] = 'explorer_warn_next',
      --       ['[w'] = 'explorer_warn_prev',
      --       [']e'] = 'explorer_error_next',
      --       ['[e'] = 'explorer_error_prev',
      --     },
      --   },
      -- },
    },
    animate = {
      fps = 30,
    },
    picker = {
      layout = {
        preset = 'telescope',
      },
      sources = {
        -- registers = {
        --
        -- },
        files = {
          hidden = true,
          actions = {
            switch_to_grep = function(picker, _)
              local snacks = require 'snacks'
              local pattern = picker.input.filter.pattern or picker.input.filter.search
              local cwd = picker.input.filter.cwd

              picker:close()

              ---@diagnostic disable-next-line: missing-fields
              snacks.picker.grep { cwd = cwd, search = pattern }
            end,
          },
          win = {
            input = {
              keys = {
                ['<a-s>'] = { 'switch_to_grep', desc = 'Switch to grep', mode = { 'i', 'n' } },
              },
            },
          },
        },
        grep = {
          hidden = true,
          actions = {

            switch_to_files = function(picker, _)
              local snacks = require 'snacks'
              local pattern = picker.input.filter.search or picker.input.filter.pattern
              local cwd = picker.input.filter.cwd

              picker:close()

              ---@diagnostic disable-next-line: missing-fields
              snacks.picker.files { cwd = cwd, pattern = pattern }
            end,
          },
          win = {
            input = {
              keys = {
                ['<a-s>'] = { 'switch_to_files', desc = 'Switch to files', mode = { 'i', 'n' } },
              },
            },
          },
        },
        word = {
          hidden = true,
        },
      },
      -- sources = {
      --   grep_word = {
      --     hidden = true,
      --     -- ignored = true,
      --   },
      --   grep = {
      --     hidden = true,
      --     -- ignored = true,
      --   },
      --   files = {
      --     hidden = true,
      --     -- ignored = true,
      --     -- follow = true,
      --     -- git_icons = true,
      --     -- list = {
      --     --   { name = 'Files', cmd = 'fd --type f --hidden --follow --exclude .git' },
      --     --   -- { name = 'Git Files', cmd = 'git ls-files' },
      --     --   -- { name = 'All Files', cmd = 'fd --type f --hidden --follow' },
      --     -- },
      --   },
      --
      --   explorer = {
      --     hidden = true,
      --     -- your explorer picker configuration comes here
      --     -- or leave it empty to use the default settings
      --   },
      -- },
    },
    -- styles = {
    --   notification = {
    --     wo = { wrap = true, rela },
    --   },
    -- },
  },
  keys = {
    {
      'gt',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'LSP Type Definitions',
    },
    {
      'gi',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'LSP Implementations',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = 'LSP Declarations',
    },
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'LSP Definitions',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      desc = 'LSP References',
    },
    {
      '<leader>gb',
      function()
        Snacks.picker.git_branches()
      end,
      desc = 'Git Branches',
    },
    {
      '<leader>fd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Find Diagnostics',
    },
    {
      '"', -- use the normal registers key command
      function()
        -- Snacks.picker.registers()
        Snacks.picker.registers {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      desc = 'Find Registers',
    },
    {
      '<leader>fs',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'Find Symbols',
    },
    {
      '<leader>fl',
      function()
        Snacks.picker.resume()
      end,
      desc = 'Find Last',
    },
    {
      '<leader>fb',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'Find Buffers',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Find by Grep',
    },
    {
      '<leader>fw',
      function()
        Snacks.picker.grep_word()
      end,
      desc = 'Find Word',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.files()
      end,
      desc = 'Find Files',
    },
    {
      '<leader>e',
      function()
        Snacks.explorer()
      end,
      desc = 'Toggle Explorer',
    },
    {
      '<leader>z',
      function()
        Snacks.zen()
      end,
      desc = 'Toggle Zen Mode',
    },
    {
      '<leader>Z',
      function()
        Snacks.zen.zoom()
      end,
      desc = 'Toggle Zoom',
    },
    {
      '<leader>.',
      function()
        Snacks.scratch()
      end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>S',
      function()
        Snacks.scratch.select()
      end,
      desc = 'Select Scratch Buffer',
    },
    {
      '<leader>n',
      function()
        Snacks.notifier.show_history()
      end,
      desc = 'Notification History',
    },
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete Buffer',
    },
    -- {
    --   '<leader>cR',
    --   function()
    --     Snacks.rename.rename_file()
    --   end,
    --   desc = 'Rename File',
    -- },
    {
      '<leader>gB',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
      mode = { 'n', 'v' },
    },
    -- {
    --   '<leader>gb',
    --   function()
    --     Snacks.git.blame_line()
    --   end,
    --   desc = 'Git Blame Line',
    -- },
    {
      '<leader>gf',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'Lazygit Current File History',
    },
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'Lazygit Log (cwd)',
    },
    {
      '<leader>un',
      function()
        Snacks.notifier.hide()
      end,
      desc = 'Dismiss All Notifications',
    },
    {
      '<c-/>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<c-_>',
      function()
        Snacks.terminal()
      end,
      desc = 'which_key_ignore',
    },
    {
      ']]',
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = 'Next Reference',
      mode = { 'n', 't' },
    },
    {
      '[[',
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = 'Prev Reference',
      mode = { 'n', 't' },
    },
    -- {
    --   '<leader>N',
    --   desc = 'Neovim News',
    --   function()
    --     Snacks.win {
    --       file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
    --       width = 0.6,
    --       height = 0.6,
    --       wo = {
    --         spell = false,
    --         wrap = false,
    --         signcolumn = 'yes',
    --         statuscolumn = ' ',
    --         conceallevel = 3,
    --       },
    --     }
    --   end,
    -- },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>uL'
        Snacks.toggle.diagnostics():map '<leader>ud'
        Snacks.toggle.line_number():map '<leader>ul'
        Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
        Snacks.toggle.treesitter():map '<leader>uT'
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
        Snacks.toggle.inlay_hints():map '<leader>uh'
        Snacks.toggle.indent():map '<leader>ug'
        Snacks.toggle.dim():map '<leader>uD'
      end,
    })
  end,
}
