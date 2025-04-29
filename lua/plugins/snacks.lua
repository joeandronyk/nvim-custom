DiagOverride = function(cwd)
  local Tree = require 'snacks.explorer.tree'
  local node = Tree:find(cwd)

  local snapshot = Tree:snapshot(node, { 'severity' })

  Tree:walk(node, function(n)
    n.severity = nil
  end, { all = true })

  local diags = vim.diagnostic.get()

  ---@param path string
  ---@param diag vim.Diagnostic
  local function add(path, diag)
    local n = Tree:find(path)
    local severity = tonumber(diag.severity) or vim.diagnostic.severity.INFO
    n.severity = math.min(n.severity or severity, severity)
  end

  for _, diag in ipairs(diags) do
    if vim.api.nvim_buf_is_valid(diag.bufnr) then
      local buf_name = vim.api.nvim_buf_get_name(diag.bufnr)
      local path = diag.bufnr and buf_name
      path = path and path ~= '' and svim.fs.normalize(path) or nil
      if path then
        add(path, diag)
        add(cwd, diag)
        for dir in Snacks.picker.util.parents(path, cwd) do
          add(dir, diag)
        end
      end
      -- else
      --   local message = 'Buffer does not exist ' .. diag.bufnr
      --   vim.notify(message, vim.log.levels.ERROR, { title = 'Buffer Not Found' })
    end
  end

  return Tree:changed(node, snapshot)
end

return {
  'folke/snacks.nvim',
  priority = 1000,
  enabled = true,
  lazy = false,
  ---@type snacks.Config
  opts = {
    lazygit = {
      config = {
        os = {
          edit = '[ -z ""$NVIM"" ] && (nvim -- {{filename}}) || (nvim --server ""$NVIM"" --remote-send ""q"" && nvim --server ""$NVIM"" --remote {{filename}})',
        },
      },
    },
    bigfile = { enabled = true },
    image = { enabled = false },
    terminal = { enabled = true, shell = 'pwsh' },
    scope = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    gitbrowse = {
      url_patterns = {
        ['gitlab%.ea%.com'] = {
          branch = '/-/tree/{branch}',
          file = '/-/blob/{branch}/{file}#L{line_start}-L{line_end}',
          permalink = '/-/blob/{commit}/{file}#L{line_start}-L{line_end}',
          commit = '/-/commit/{commit}',
        },
      },
    },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    -- scroll = { enabled = true }, -- this makes scrolling slow and choppy
    statuscolumn = { enabled = true },
    words = { enabled = true },
    animate = {
      fps = 30,
    },
    picker = {
      layout = {
        preset = 'telescope',
      },
      formatters = {
        file = {
          truncate = 10000,
        },
      },
      sources = {
        projects = {
          finder = 'recent_projects',
          format = 'file',
          dev = {
            '~/AppData/Local/nvim',
            'd:/git_projects',
            'd:/Projects/Git',
          },
          -- custom function for loading the session.
          confirm = function(picker, item)
            require('persistence').save()
            picker:close()
            if not item then
              return
            end
            local dir = item.file
            vim.cmd '%bd!'
            vim.fn.chdir(dir)
            require('persistence').load()
          end,
          patterns = { '.gitignore', 'Makefile' },
          recent = true,
          matcher = {
            frecency = true, -- use frecency boosting
            sort_empty = true, -- sort even when the filter is empty
            cwd_bonus = false,
          },
          sort = { fields = { 'score:desc', 'idx' } },
        },
        files = {
          hidden = true,
          include = { '.payload', '.mortar' },
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
          include = { '.payload', '.mortar' },
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
          include = { '.payload', '.mortar' },
        },
        explorer = {
          hidden = true,
          ignored = false,
          watch = false,
          include = { '.payload', '.mortar' },
          replace_netrw = true,
          diagnostics = true,
          git_status = true,
          -- your explorer picker configuration comes here
          -- or leave it empty to use the default settings
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
      '<leader>fs',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'Find Symbols',
    },
    {
      '<leader>fp',
      function()
        Snacks.picker.projects {
          on_show = function()
            vim.cmd.stopinsert()
          end,
        }
      end,
      desc = 'Find Projects',
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
      '<leader>fu',
      function()
        Snacks.picker.undo()
      end,
      desc = 'Undo History',
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
    -- {
    --   '<leader>z',
    --   function()
    --     Snacks.zen()
    --   end,
    --   desc = 'Toggle Zen Mode',
    -- },
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
    -- override the diagnostics to make sure buffers are valid to avoid the error
    local snacks_diag = require 'snacks.explorer.diagnostics'
    snacks_diag.update = DiagOverride

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
        -- To see the available highlights run this command
        -- lua: Snacks.picker.highlights({pattern = "hl_group:^Snacks"})
        vim.api.nvim_set_hl(0, 'SnacksPickerPathHidden', { fg = '#ff0000', bg = 'NONE', italic = true })
        vim.api.nvim_set_hl(0, 'SnacksPickerPathIgnored', { fg = '#00ff00', bg = 'NONE', bold = true })
        vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = '#658594', bg = 'NONE', bold = true })
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
