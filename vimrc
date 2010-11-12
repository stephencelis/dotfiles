" * General Settings
"
" Use zsh.
set shell=zsh

" Use UTF-8.
scriptencoding utf-8

" Detect filetypes, indent files.
filetype plugin indent on

" Syntax highlighting.
set nocompatible
syntax on

" Highlight matching parentheses.
set showmatch

" Use the tab complete menu.
set wildmenu
set wildmode=list:longest,full

" Disable bell.
set vb t_vb=

" Enable error files & error jumping.
set cf

" Write on make/shell commands.
set autowrite

" Read external modifications.
set autoread


" * Text Formatting
"
" Don't wrap.
set nowrap

" Indent with 2 spaces.
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

" Line numbers.
" set number
" set numberwidth=3

" Enable backspace in insert mode.
set backspace=indent,eol,start

" Don't use Ex mode, use Q for formatting.
map Q gq

set colorcolumn=81

" Destroy tabs and trailing whitespace.
autocmd BufWritePre * :%s/\s\+$//e
" autocmd BufWritePre * :retab


" * Window Splits
"
" Open new horizontal windows below.
set splitbelow

" Open new vertical windows to the right.
set splitright

" Speed.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" * Quick Keybindings
"
" Quick, jump out of insert mode while no one is looking.
imap jj <Esc>

" Avoid ESC => F1 slips.
nmap <F1> <Esc>
map! <F1> <Esc>

" Yank from the cursor to the end of the line.
nnoremap Y y$

" Emacs-like movement in insert mode.
map! <C-A> <Home>
map! <C-E> <End>


" * Commands
"
" Semi-.
nnoremap ; :

" Atomic writes.
command W w !sudo tee % >/dev/null


" * Search
"
" Show matches while typing.
set incsearch

" Highlight search results once found.
set hlsearch

" Ignore case.
set ignorecase

" Smart about case matching.
set smartcase


" * Display
"
" Always show status
set laststatus=2

" Show tabs and trailing whitespace.
" set list

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" set listchars=tab:··,trail:·

" Show cursor position.
set ruler

" 5 lines of context.
set scrolloff=5

" Scroll 5 lines at a time.
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Short messages.
set shortmess="at1" " aOstT

" Show incomplete commands.
set showcmd

" Set title.
set title


" * Buffers
"
" Hideable buffers.
set hidden


" * Nostalgia
"
" Backup, to tmp.
set backup
set backupdir=/var/tmp

" Swap to tmp.
set directory=/var/tmp

" History.
set history=100

" Undo.
set undofile
set undodir=/var/tmp


" * Miscellanea
"
" Take me to your leader.
let mapleader = ","

" Gsub by default.
set gdefault

" Tabracketing.
nnoremap <Tab> %
vnoremap <Tab> %

" Omnicomplete.
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" Oh, man.
runtime ftplugin/man.vim

" Self-discipline:
nnoremap <leader>ev :tabe $MYVIMRC<cr>

" Start augroup.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " Always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

augroup END


" * Plugins
"
" Pathogen: github.com/tpope/vim-pathogen
call pathogen#runtime_append_all_bundles()


" Ack: leader.
nnoremap <leader>a :Ack<Space>


" Conque: shell.
nnoremap <leader>sh :ConqueTermSplit zsh<CR>
nnoremap <leader>vsh :ConqueTermVSplit zsh<CR>


" Coffee: script.
au BufNewFile,BufRead *.coffee set filetype=coffee


" Gundo: shortcut.
nnoremap <F5> :GundoToggle<CR>


" NERD_commenter: whitespace-friendly.
let NERDSpaceDelims=1


" NERD_tree: don't hijack netrw.
let NERDTreeHijackNetrw=0


" Rails: Navi.
autocmd User Rails Rnavcommand job app/jobs -glob=**/* -suffix=_job.rb
autocmd User Rails Rnavcommand coffeescript app/coffeescripts -glob=**/* -suffix=.coffee
autocmd User Rails Rnavcommand stylesheet app/stylesheets -glob=**/* -suffix=.sass


" RDoc: set filetype.
au BufNewFile,BufRead *.rdoc set filetype=rdoc


" Scratch: leader.
nnoremap <leader><Tab> :Sscratch<CR>


" YankRing: a hidden history.
let g:yankring_history_file = '.yankring_history'
