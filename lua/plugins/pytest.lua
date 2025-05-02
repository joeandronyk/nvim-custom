return {
  'richardhapb/pytest.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  opts = {}, -- Define the options here
  config = function(_, opts)
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'python', 'xml' },
    }

    require('pytest').setup {
      docker = {
        enabled = false, -- Enable docker support
        container = 'app-1', -- Container where the tests will be run
        docker_path = '/usr/src/app', -- This is the default path, if you use docker compose this is obtained from the docker compose file
        docker_path_prefix = 'app', -- This is the prefix for the path in the cwd in your local, for example: root/app/<docker_app_content>
        enable_docker_compose = false, -- Enable docker compose support
        docker_compose_file = 'docker-compose.yml', -- This is the default docker compose file name
        docker_compose_service = 'app', -- This is docker service name in docker compose for looking for retrieve docker path
      },

      add_args = '-v', -- Additional arguments to pass to pytest
      open_output_onfail = true, -- Open the buffer with output automatically if fails

      -- You can overwrite this callback with your custom keymaps,
      -- this is called when open a Python file and buffer number is passed as an argument
      keymaps_callback = function(bufnr)
        vim.keymap.set('n', '<leader>TT', '<CMD>Pytest<CR>', { buffer = bufnr, desc = 'Run Pytest' })
        vim.keymap.set('n', '<leader>Ta', '<CMD>PytestAttach<CR>', { buffer = bufnr, desc = 'Attach Pytest to buffer' })
        vim.keymap.set('n', '<leader>Td', '<CMD>PytestDetach<CR>', { buffer = bufnr, desc = 'Detach Pytest' })
      end,
    }
  end,
}
