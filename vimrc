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
" set vb t_vb=

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

" Destroy tabs and trailing whitespace.
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :retab


" * Window Splits
"
" Open new horizontal windows below.
set splitbelow

" Open new vertical windows to the right.
set splitright


" * Quick Keybindings
"
" Quick, jump out of insert mode while no one is looking.
imap ii <Esc>

" Avoid ESC => F1 slips.
nmap <F1> <Esc>
map! <F1> <Esc>

" Yank from the cursor to the end of the line.
nnoremap Y y$

" Emacs-like movement in insert mode.
map! <C-A> <Home>
map! <C-E> <End>

" Avoid using arrow keys.
imap <C-H><C-H> <C-O>h
imap <C-J><C-J> <C-O>j
imap <C-K><C-K> <C-O>k
imap <C-L><C-L> <C-O>l


" * Commands
"
" Atomic writes.
command W w !sudo tee % >/dev/null


" * Search
"
" Show matches while typing.
set incsearch

" Highlight search results once found.
set hlsearch

" Ignore case.
" set ignorecase

" Smart about case matching.
set smartcase


" * Display
"
" Always show status
set laststatus=2

" Show tabs and trailing whitespace.
set list
" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬
set listchars=tab:··,trail:·

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


" * Miscellanea
"
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


" NERD_commenter: whitespace-friendly.
let NERDSpaceDelims=1
