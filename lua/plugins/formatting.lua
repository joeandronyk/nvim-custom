return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    local conform = require 'conform'

    conform.setup {
      formatters_by_ft = {
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        svelte = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        liquid = { 'prettier' },
        lua = { 'stylua' },
        python = { 'ruff_fix', 'ruff_format' },
      },
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
    }

    vim.api.nvim_create_user_command('FormatToggle', function()
      -- Check the current state and toggle it
      if vim.g.disable_autoformat or vim.b.disable_autoformat then
        vim.g.disable_autoformat = false
        vim.b.disable_autoformat = false
        print 'Autoformat-on-save enabled'
      else
        vim.g.disable_autoformat = true
        vim.b.disable_autoformat = true
        print 'Autoformat-on-save disabled'
      end
    end, {
      desc = 'Toggle autoformat-on-save',
    })

    vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
      conform.format {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      }
    end, { desc = 'Format file or range (in visual mode)' })

    vim.keymap.set({ 'n' }, '<leader>xf', '<CMD>FormatToggle<CR>', { desc = 'Toggle Format on Save' })
  end,
}
