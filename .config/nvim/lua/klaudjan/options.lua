vim.opt.autoindent = true  -- New lines inherit the indentation of previous lines.
vim.opt.expandtab = true  -- Convert tabs to spaces.
vim.opt.tabstop = 4  -- Indent using 4 spaces
vim.opt.ruler = true -- Always shows location in file (line#)
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent.

vim.opt.smartcase = true -- Automatically switch search to case-sensitive when search query ocntains an uppercase letter
vim.opt.scrolloff = 1 -- The number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 5 -- The number  of screen columns to keep to the left and right of the cursor.
vim.opt.laststatus = 2 -- Always display the status basr
vim.opt.ruler = true -- Always show cursor position
vim.opt.number = true  -- Show line numbers on the sidebar
vim.opt.relativenumber = true  -- Show line number on the current line and relative numbers on all other lines
vim.opt.confirm = true  -- Display a confirmation dialog when closing an unsaved file
vim.opt.backspace = indent,eol  -- In insert mode you can delete only what you have written in that moment, nothing else
vim.opt.listchars = {
    eol = '¬',
    trail = '•'
}  -- Pair the invisible characters with a simbol
vim.opt.list = true  -- Show all invisible characters (spaces, tabs, eol, ...) if defined in listchars
