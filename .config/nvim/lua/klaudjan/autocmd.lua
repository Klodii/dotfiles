-- Automatically delete all trailing whitespaces on save
vim.api.nvim_create_autocmd("BufWritePre", {command = [[%s/\s\+$//e]]})

-- Recompile suckless programs Automatically
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = {"config.h", "config.def.h"},
    command = "!sudo make clean install"
})
