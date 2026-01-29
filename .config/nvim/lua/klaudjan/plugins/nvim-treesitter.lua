return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      -- Basic setup
      require('nvim-treesitter').install({
        "c", "cpp", "cmake", "comment", "go", "java", "javascript",
        "jsx", "lua", "markdown", "markdown_inline",
        "python", "rust", "typescript", "tsx", "vim", "vue", "zsh", "bash", "sh"
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "cpp", "cmake", "go", "java", "javascript", "javascriptreact", "ledger",
          "lua", "markdown", "python", "rust", "typescript", "typescriptreact", "vue"
        },
        callback = function()
          vim.treesitter.start()
        end,
        group = nvimrc_augroup
      })


      -- Toggle mappings
      vim.keymap.set('n', '<leader>st', function()
        if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil then
          vim.treesitter.stop()
          vim.print("Turned off treesitter highlighting...")
        else
          vim.treesitter.start()
          vim.print("Turned on treesitter highlighting...")
        end
      end, { noremap = true, silent = true, desc = "Toggle treesitter highlighting" })

      vim.keymap.set('n', '<leader>sT', function()
        local current_indentexpr = vim.bo.indentexpr
        local current_buffer = vim.api.nvim_get_current_buf()
        if current_indentexpr ~= "v:lua.require('nvim-treesitter').indentexpr()" then
          vim.b[current_buffer].rahlir_previous_indentexpr = current_indentexpr
          vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
          vim.print("Turned on treesitter indent...")
        else
          local previous_indentexpr = vim.b[current_buffer].rahlir_previous_indentexpr
          if previous_indentexpr == nil then
            previous_indentexpr = ""
          end
          vim.bo.indentexpr = previous_indentexpr
          vim.print("Turned off treesitter indent...")
        end
      end, { noremap = true, silent = true, desc = "Toggle treesitter indent" })

      -- Operation keymappings
      vim.keymap.set("n", "<leader>ti", "<cmd>InspectTree<CR>", { desc = 'Open Treesitter Tree ("TSPlayground")' })
      vim.keymap.set("n", "<leader>tq", "<cmd>EditQuery<CR>", { desc = 'open the Live Query Editor of Treesitter' })
    end
  }
}
