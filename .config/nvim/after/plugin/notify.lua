vim.opt.termguicolors = true -- required by notify

notify = require("notify")
notify.setup({
    render = "minimal",
    stages = "static",
})
vim.notify = notify

vim.keymap.set("n", "<leader>ln", "<cmd>Telescope notify<cr>", { desc = 'show the list of all notifications through Tlescope' })
