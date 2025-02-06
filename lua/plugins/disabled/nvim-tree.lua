return {
  {
    'nvim-tree/nvim-tree.lua',
    enabled = false,
    lazy = true,
    config = function()
      local api = require 'nvim-tree.api'

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
          --     { key = { 'l', '<CR>', 'o' }, cb = api.node.open.edit, 'Open' },
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

-- KEY MAPPINGS
-- `<C-]>`           CD                         |nvim-tree-api.tree.change_root_to_node()|
-- `<C-e>`           Open: In Place             |nvim-tree-api.node.open.replace_tree_buffer()|
-- `<C-k>`           Info                       |nvim-tree-api.node.show_info_popup()|
-- `<C-r>`           Rename: Omit Filename      |nvim-tree-api.fs.rename_sub()|
-- `<C-t>`           Open: New Tab              |nvim-tree-api.node.open.tab()|
-- `<C-v>`           Open: Vertical Split       |nvim-tree-api.node.open.vertical()|
-- `<C-x>`           Open: Horizontal Split     |nvim-tree-api.node.open.horizontal()|
-- `<BS>`            Close Directory            |nvim-tree-api.node.navigate.parent_close()|
-- `<CR>`            Open                       |nvim-tree-api.node.open.edit()|
-- `<Tab>`           Open Preview               |nvim-tree-api.node.open.preview()|
-- `>`               Next Sibling               |nvim-tree-api.node.navigate.sibling.next()|
-- `<`               Previous Sibling           |nvim-tree-api.node.navigate.sibling.prev()|
-- `.`               Run Command                |nvim-tree-api.node.run.cmd()|
-- `-`               Up                         |nvim-tree-api.tree.change_root_to_parent()|
-- `a`               Create File Or Directory   |nvim-tree-api.fs.create()|
-- `bd`              Delete Bookmarked          |nvim-tree-api.marks.bulk.delete()|
-- `bt`              Trash Bookmarked           |nvim-tree-api.marks.bulk.trash()|
-- `bmv`             Move Bookmarked            |nvim-tree-api.marks.bulk.move()|
-- `B`               Toggle Filter: No Buffer   |nvim-tree-api.tree.toggle_no_buffer_filter()|
-- `c`               Copy                       |nvim-tree-api.fs.copy.node()|
-- `C`               Toggle Filter: Git Clean   |nvim-tree-api.tree.toggle_git_clean_filter()|
-- `[c`              Prev Git                   |nvim-tree-api.node.navigate.git.prev()|
-- `]c`              Next Git                   |nvim-tree-api.node.navigate.git.next()|
-- `d`               Delete                     |nvim-tree-api.fs.remove()|
-- `D`               Trash                      |nvim-tree-api.fs.trash()|
-- `E`               Expand All                 |nvim-tree-api.tree.expand_all()|
-- `e`               Rename: Basename           |nvim-tree-api.fs.rename_basename()|
-- `]e`              Next Diagnostic            |nvim-tree-api.node.navigate.diagnostics.next()|
-- `[e`              Prev Diagnostic            |nvim-tree-api.node.navigate.diagnostics.prev()|
-- `F`               Live Filter: Clear         |nvim-tree-api.live_filter.clear()|
-- `f`               Live Filter: Start         |nvim-tree-api.live_filter.start()|
-- `g?`              Help                       |nvim-tree-api.tree.toggle_help()|
-- `gy`              Copy Absolute Path         |nvim-tree-api.fs.copy.absolute_path()|
-- `ge`              Copy Basename              |nvim-tree-api.fs.copy.basename()|
-- `H`               Toggle Filter: Dotfiles    |nvim-tree-api.tree.toggle_hidden_filter()|
-- `I`               Toggle Filter: Git Ignore  |nvim-tree-api.tree.toggle_gitignore_filter()|
-- `J`               Last Sibling               |nvim-tree-api.node.navigate.sibling.last()|
-- `K`               First Sibling              |nvim-tree-api.node.navigate.sibling.first()|
-- `L`               Toggle Group Empty         |nvim-tree-api.node.open.toggle_group_empty()|
-- `M`               Toggle Filter: No Bookmark |nvim-tree-api.tree.toggle_no_bookmark_filter()|
-- `m`               Toggle Bookmark            |nvim-tree-api.marks.toggle()|
-- `o`               Open                       |nvim-tree-api.node.open.edit()|
-- `O`               Open: No Window Picker     |nvim-tree-api.node.open.no_window_picker()|
-- `p`               Paste                      |nvim-tree-api.fs.paste()|
-- `P`               Parent Directory           |nvim-tree-api.node.navigate.parent()|
-- `q`               Close                      |nvim-tree-api.tree.close()|
-- `r`               Rename                     |nvim-tree-api.fs.rename()|
-- `R`               Refresh                    |nvim-tree-api.tree.reload()|
-- `s`               Run System                 |nvim-tree-api.node.run.system()|
-- `S`               Search                     |nvim-tree-api.tree.search_node()|
-- `u`               Rename: Full Path          |nvim-tree-api.fs.rename_full()|
-- `U`               Toggle Filter: Hidden      |nvim-tree-api.tree.toggle_custom_filter()|
-- `W`               Collapse                   |nvim-tree-api.tree.collapse_all()|
-- `x`               Cut                        |nvim-tree-api.fs.cut()|
-- `y`               Copy Name                  |nvim-tree-api.fs.copy.filename()|
-- `Y`               Copy Relative Path         |nvim-tree-api.fs.copy.relative_path()|
-- `<2-LeftMouse>`   Open                       |nvim-tree-api.node.open.edit()|
-- `<2-RightMouse>`  CD                         |nvim-tree-api.tree.change_root_to_node()|
