return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
      require("oil").setup({
        -- I added only two new command 'h' and 'l', all the others are the
        -- default
        keymaps = {
          ["g?"] = { "actions.show_help", mode = "n" },
          ["<CR>"] = "actions.select",
          ["L"] = "actions.select",
          ["SV"] = { "actions.select", opts = { vertical = true } },
          ["SH"] = { "actions.select", opts = { horizontal = true } },
          ["T"] = { "actions.select", opts = { tab = true } },
          ["P"] = { "actions.preview", opts = { split = "belowright" } },
          ["C"] = { "actions.close", mode = "n" },
          ["gr"] = "actions.refresh",
          ["-"] = { "actions.parent", mode = "n" },
          ["H"] = { "actions.parent", mode = "n" },
          ["_"] = { "actions.open_cwd", mode = "n" },
          ["`"] = { "actions.cd", mode = "n" },
          ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
          ["gs"] = { "actions.change_sort", mode = "n" },
          ["gx"] = "actions.open_external",
          ["g."] = { "actions.toggle_hidden", mode = "n" },
          ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            -- dont' show the parent dir '..'
            -- % is the escape character in lua
            local parentDir = "^%.%.$"
            local m = name:match(parentDir)
            return m ~= nil
          end
        },
      })

      vim.keymap.set("n", "<leader>ft", ":Oil<CR>", { desc = 'return to file tree' }) -- Lex stands for Lexplorer
      vim.keymap.set("n", "H", ":Oil<CR>", { desc = 'return to file tree' })          -- Lex stands for Lexplorer
    end
  }
}
