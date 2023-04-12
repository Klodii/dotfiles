set autoindent " New lines inherit the indentation of previous lines.
set expandtab " Convert tabs to spaces.
set tabstop=4 " Indent using four spaces.
set showmatch " Shows matching brackets
set ruler " Always shows location in file (line#)
set smarttab " Autotabs for certain code
set shiftwidth=4 "Number of spaces to use for each step of (auto)indent.
set hlsearch " Enable search highlighting.
set ignorecase " Ignore case when searching.
set incsearch " Incremental search that shows partial matches.
set smartcase " Automatically switch search to case-sensitive when search query contains an uppercase letter.
set scrolloff=8 " The number of screen lines to keep above and below the cursor.
set colorcolumn=80  "  Color a column, used to check when reaceah a certain limit
set sidescrolloff=5 " The number of screen columns to keep to the left and right of the cursor.
set laststatus=2 " Always display the status bar.
set ruler " Always show cursor position.
set number " Show line numbers on the sidebar.
set relativenumber " Show line number on the current line and relative numbers on all other lines.
" set mouse=a " Enable mouse for scrolling and resizing.
set title " Set the window’s title, reflecting the file currently being edited.
set confirm " Display a confirmation dialog when closing an unsaved file.
" set spell " Enable spellchecking.
set backupdir=~/.cache/vim/backup//,. " Directory to store backup files.
set dir=~/.cache/vim/swap//,. " Directory to store swap files. The double slash at the end ensures that there is no conflict in case of two files having the same name,The ,. allow vim to use the current directory if the former doesn't exist.
syntax on " Turn on syntax highlighting.
" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
"In order to switch between buffers (when opening a file with the command :e)
"with tab rather than with :bn (buffer next) command and :bp (buffer previous) command
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

"Copy selected text to system clipboard (requires gvim installed)
vnoremap <C-c> "*Y :let @+=@*<CR>
map <C-p> "+P

"Automatically delete all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Pair the invisible characters with a simbol
set listchars=eol:¬,trail:•
" Show all invisible characters (spaces, tabs, eol, ...) if defined in listchars
set list
" In insert mode you can delete only what you have written in that moment, nothing else
set backspace=indent,eol "no start

" Recompile suckless programs automatically:
autocmd BufWritePost config.h,config.def.h !sudo make clean install


" Change the highlight color schem for Visual Mode
" text under visual mode will have this font and color

" `hi` highlight command
" `Visual` set colors and font only for Visual mode
" `cterm` possible values are
"   - bold
"   - underline
"   - reverse
"   - italic
"   - none
"
" `ctermbg` sets the background color
" `ctermfg` sets the foreground color
" available colors:
"     NR-16   NR-8    COLOR NAME
"     0       0       Black
"     1       4       DarkBlue
"     2       2       DarkGreen
"     3       6       DarkCyan
"     4       1       DarkRed
"     5       5       DarkMagenta
"     6       3       Brown, DarkYellow
"     7       7       LightGray, LightGrey, Gray, Grey
"     8       0*      DarkGray, DarkGrey
"     9       4*      Blue, LightBlue
"     10      2*      Green, LightGreen
"     11      6*      Cyan, LightCyan
"     12      1*      Red, LightRed
"     13      5*      Magenta, LightMagenta
"     14      3*      Yellow, LightYellow
"     15      7*      White
hi Visual cterm=italic ctermbg=Yellow ctermfg=Black
colorscheme slate
set cursorline  " To make the line of the cursor highlighted
