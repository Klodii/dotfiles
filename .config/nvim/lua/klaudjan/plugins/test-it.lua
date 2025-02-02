return {
  {
    "Klodii/test-it.nvim",
    config = function()
      require 'test-it'.setup({
        path_prefix_to_remove = 'application/',
        test_command = 'source scripts/aliases* && dtest ',
      })


      vim.keymap.set("n", "<leader>tf", '<cmd>TestFile<CR>', { desc = 'Run file tests' })
      vim.keymap.set("n", "<leader>tc", '<cmd>TestIt<CR>', { desc = 'Run test under the cursor' })
      vim.keymap.set("n", "<leader>to", '<cmd>OpenTestTerm<CR>', { desc = 'Open the test floating window' })
      vim.keymap.set("n", "<leader>tn", '<cmd>CopyTestPath<CR>',
        { desc = 'Copy full test name, related to the cursor position' })
    end
  }
}
