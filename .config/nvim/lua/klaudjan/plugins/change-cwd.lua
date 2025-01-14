return {
  {
    dir = "~/playground/nvim-plugins/change-cwd.nvim",
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      require "change-cwd".setup({ root_dir = '~/work/forest/' })
      vim.keymap.set("n", "<leader>ff", "<cmd>:lua require('change-cwd').change_working_directory()<cr>",
        { desc = 'change current working directory' })
    end
  }
}
