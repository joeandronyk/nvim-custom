return {
  'kevinhwang91/nvim-ufo',
  lazy = false,
  enabled = false,
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    vim.o.foldmethod = 'manual'
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider needs a large value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:►]]

    vim.keymap.set('n', 'zO', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zC', require('ufo').closeAllFolds, { desc = 'Close all folds' })
    vim.keymap.set('n', 'zK', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = 'Peek Fold' })

    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        -- return { 'lsp', 'indent' }
        return { 'treesitter', 'indent' }
      end,
    }
  end,
}
