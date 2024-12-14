return {
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      local api = require 'nvim-tree.api'
      -- local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
      -- if not config_status_ok then
      --   return
      -- end
      --
      -- local tree_cb = nvim_tree_config.nvim_tree_callback

      require('nvim-tree').setup {
        on_attach = function(bufnr)
          local opts = { buffer = bufnr }
          api.config.mappings.default_on_attach(bufnr)
          -- function for left to assign to keybindings
          local lefty = function()
            local node = api.tree.get_node_under_cursor()
            -- if it's a node and it's open, close
            if node.nodes and node.open then
              api.node.open.edit()
            -- else left jumps up to parent
            else
              api.node.navigate.parent()
            end
          end
          -- function for right to assign to keybindings
          local righty = function()
            local node = api.tree.get_node_under_cursor()
            -- if it's a closed node, open it
            -- if node_at_cursor.nodes and not node_at_cursor.open then
            if node.nodes then
              api.node.open.edit()
            else
              api.node.open.edit()
            end
          end
          vim.keymap.set('n', 'h', lefty, opts)
          vim.keymap.set('n', '<Left>', lefty, opts)
          vim.keymap.set('n', '<Right>', righty, opts)
          vim.keymap.set('n', 'l', righty, opts)
        end,
        sort = {
          sorter = 'case_sensitive',
        },
        view = {
          width = 30,
          -- mappings = {
          --   list = {
          --     { key = { 'l', '<CR>', 'o' }, cb = tree_cb 'edit' },
          --     { key = 'h', cb = tree_cb 'close_node' },
          --     { key = 'v', cb = tree_cb 'vsplit' },
          --   },
          -- },
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
        actions = {
          open_file = {
            window_picker = { enable = false },
            quit_on_open = false,
          },
        },
      }
    end,
    keys = {
      { '<leader>w', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
    },
  },
}
