set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'actionscript.vim'
Bundle 'Color-Sampler-Pack'
Bundle 'CSApprox'
Bundle 'file-line'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'sjl/gundo.vim'
" Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wgibbs/vim-irblack'
Bundle 'wincent/Command-T'

filetype indent plugin on
colorscheme wombat256
syntax enable
nnoremap \ ,
let mapleader = ','

set visualbell t_vb=
set title
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)\ %P
set showcmd

set cursorline
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

set shiftwidth=2 tabstop=2
set expandtab
set autoindent

set wildmenu
set wildmode=list:longest,full

set hidden
set backup
set backupdir=/var/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=/var/tmp
set undofile
set undodir=/var/tmp

match Error /\v\s+$/

nnoremap <leader>/ :nohlsearch<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
