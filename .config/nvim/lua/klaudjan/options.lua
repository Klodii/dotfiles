vim.opt.guicursor = ""                  -- To make the cursor fat even in insert mode
vim.opt.cursorline = true               -- To make the line of the cursor highlighted

vim.opt.number = true                   -- Show line numbers on the sidebar
vim.opt.relativenumber = true           -- Show line number on the current line and relative numbers on all other lines

vim.opt.autoindent = true               -- New lines inherit the indentation of previous lines.
vim.opt.shiftwidth = 4                  -- Number of spaces to use for each step of (auto)indent.
vim.opt.expandtab = true                -- Convert tabs to spaces.
vim.opt.tabstop = 4                     -- Indent using 4 spaces

vim.opt.scrolloff = 8                   -- The number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 5               -- The number  of screen columns to keep to the left and right of the cursor.
vim.opt.colorcolumn = "80"              -- Color a column, used to check when reaceah a certain limit
vim.opt.textwidth = 80                  -- line break when reaced a certain limit, new text will go in new line
vim.opt.laststatus = 2                  -- Always display the status basr
vim.opt.ruler = true                    -- Always show cursor position
vim.opt.confirm = true                  -- Display a confirmation dialog when closing an unsaved file
vim.opt.backspace = { "indent", "eol" } -- In insert mode you can delete only what you have written in that moment, nothing else
vim.opt.listchars = {
  eol = '↴',
  trail = '•',
  tab = '▸- ' -- Given that we converted tabs into spaces (vim.opt.expandtab) we will not see this character
} -- Pair the invisible characters with a simbol
vim.opt.list = true -- Show all invisible characters (spaces, tabs, eol, ...) if defined in listchars

vim.opt.swapfile = false -- Disable swapfile
vim.opt.backup = false -- Disable backup files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


vim.opt.hlsearch = true   -- Enable search highlighting
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.incsearch = true  -- Incremental search that shows partial matches
vim.opt.smartcase = true  -- Automatically switch search to case-sensitive when search query contains an uppercase letter.

vim.opt.completeopt = { "menu", "preview", "menuone", "noselect" }

vim.opt.winborder = 'rounded'

-- :Explorer settings
-- :Explore variants.
--     - Hexplore: Will create a horizontal split and show the directory in the lower window.
--                 The variant with an ! will show the directory in the opposite side.
--     - Vexplore: Will create a vertical split and show the directory on the left side.
--                 The variant with an ! will show the directory in the opposite side.
--     - Sexplore: Will create a horizontal split and show the directory in the upper window.
--                 The variant with an ! will create a vertical split and show the directory on the left side.
--     - Texplore: Will create a new tabpage to show the directory.
--     - Lexplore: It works almost like Vexplore, but Lexplore will open a file on the window where we called the command.
--                 It will also work as way to toggle a Netrw window. You can watch it in action in this demo.
vim.g.netrw_keepdir = 0  -- Keep the current directory and the browsing directory synced. This helps you avoid the move files error.
vim.g.netrw_winsize = 30 -- Change the size of the Netrw window when it creates a split. I think 30% is fine.
vim.g.netrw_banner = 0   -- Hide the banner (if you want). To show it temporarily you can use I inside Netrw.
