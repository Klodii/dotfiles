return {
  {
    dir = "~/playground/nvim-plugins/change-cwd.nvim",
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      vim.keymap.set("n", "<leader>ff", "<cmd>:lua require('change-cwd').change_working_directory()<cr>",
        { desc = 'change current working directory' })
    end
  }
}
