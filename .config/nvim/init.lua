require("klaudjan")
print("Hello")
vim.opt.relativenumber = true
-- Try to prevent bad habits like using the arrow keys for movement.
-- Do this in normal mode...
vim.cmd("nnoremap <Left>  :echoe 'Use h'<CR>")
vim.cmd("nnoremap <Right> :echoe 'Use l'<CR>")
vim.cmd("nnoremap <Up>    :echoe 'Use k'<CR>")
vim.cmd("nnoremap <Down>  :echoe 'Use j'<CR>")
-- ...and in insert mode
vim.cmd("inoremap <Left>  <ESC>:echoe 'Use h'<CR>")
vim.cmd("inoremap <Right> <ESC>:echoe 'Use l'<CR>")
vim.cmd("inoremap <Up>    <ESC>:echoe 'Use k'<CR>")
vim.cmd("inoremap <Down>  <ESC>:echoe 'Use j'<CR>")
