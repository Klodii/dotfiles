return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
  },
  config = function()
    require("telescope").setup({
      defaults = {
        preview = {
          filesize_limit = 0.1, -- MB
        },
      },
      extensions = { fzf = {} },
    })

    require('telescope').load_extension('fzf')

    -- When in telescope window if you press CTRL-/ you will open the Keymaps helper

    local multigrep = require "klaudjan.telescope_multigrep"
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sf', function() builtin.find_files({ hidden = true, no_ignore = true }) end,
      { desc = 'search file}' })
    vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = 'search only in git files' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'search in help tags' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'search keymap' })
    vim.keymap.set('n', '<leader>gd', "<cmd>Telescope lsp_definitions<cr>", { desc = 'Telescope go to definitios' })
    vim.keymap.set('n', '<leader>gr', "<cmd>Telescope lsp_references<cr>", { desc = 'Telescope go to references' })
    vim.keymap.set('n', '<leader>sw', multigrep.live_multigrep,
      { desc = 'Search with RipGrep in all files the word specified' })
    vim.keymap.set('n',
      '<leader>en',
      function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") });
      end,
      { desc = 'edit a neovim configuration file' }
    )
    vim.keymap.set('n',
      '<leader>ep',
      function()
        local lazy_installation_directory = "lazy/"
        builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), lazy_installation_directory) });
      end,
      { desc = 'edit a installed package file' }
    )
  end
}
