local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = '[a]dd file to Harpoon list' })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = 'list Harpoon files' })

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = 'Navigate to first Harpoon file' })
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end, { desc = 'Navigate to second Harpoon file' })
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end, { desc = 'Navigate to third Harpoon file' })
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end, { desc = 'Navigate to fourth Harpoon file' })

