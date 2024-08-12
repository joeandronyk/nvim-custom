return {
  {
    'danymat/neogen',
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    dependencies = 'nvim-treesitter/nvim-treesitter',
    cmd = 'Neogen',
    config = function()
      require('neogen').setup {

        languages = {
          python = {
            template = {
              annotation_convention = 'reST', -- for a full list of annotation_conventions, see supported-languages below,
            },
          },
        },
      }
    end,
    -- enabled = true,
    keys = {
      {
        '<leader>ga',
        function()
          require('neogen').generate {}
        end,
        desc = 'Generate Annotations',
      },
    },
  },
}
