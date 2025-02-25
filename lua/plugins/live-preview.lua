return {
  'brianhuster/live-preview.nvim',
  dependencies = {
    -- You can choose one of the following pickers
    -- 'nvim-telescope/telescope.nvim',
    -- 'ibhagwan/fzf-lua',
    -- 'echasnovski/mini.pick',
  },
  -- Use LivePreview start and LivePreview close
  cmd = { 'LivePreview', 'LivePreviewStop', 'LivePreviewToggle' },
}
