require('todo-comments').setup()

-- todo-comments keyworkds are described in the github repository or by
-- `:h todo-comments`
vim.keymap.set("n", "<leader>tdt", "<cmd>TodoTelescope<cr>", { desc = 'List all todo-comments keywords in Telescope' })
vim.keymap.set("n", "<leader>tdq", "<cmd>TodoQuickFix<cr>", { desc = 'List all todo-comments keywords in QuickFix window' })
vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope keywords=TODO<cr>", { desc = 'List all TODO keywords in QuickFix window' })

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

vim.keymap.set("n", "]e", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })
