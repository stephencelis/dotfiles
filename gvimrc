colorscheme ir_black
" set guifont=Menlo:h13
set guifont=Inconsolata:h16
set columns=159
set lines=45
" set lbr
set guioptions+=c
set guioptions-=r
set guioptions-=T
set number

set path+=**
" set transparency=5

if has("autocmd")
  augroup txt
    au!
    autocmd GUIEnter *.txt set nolist
    autocmd GUIEnter *.txt set columns=80
    autocmd GUIEnter *.txt set noruler
    autocmd GUIEnter *.txt set nonumber
    autocmd GUIEnter *.txt set linebreak
    autocmd VimEnter *.txt set fullscreen
  augroup END
endif
