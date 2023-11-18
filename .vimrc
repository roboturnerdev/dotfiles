let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:newrw_preview = 1
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

autocmd VimEnter * :Lex

" line numbers
set number

" remove netrw bars
set fillchars-=vert:\|

" status bar
set laststatus=2

" no vi
set nocompatible
