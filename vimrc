set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'stephencelis/vim-mml'
Bundle 'actionscript.vim'
Bundle 'Color-Sampler-Pack'
if has('gui')
  Bundle 'CSApprox'
endif
Bundle 'file-line'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'skammer/vim-css-color'
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
Bundle 'wavded/vim-stylus'
Bundle 'wgibbs/vim-irblack'
" Bundle 'wincent/Command-T'

filetype indent plugin on
colorscheme wombat256
syntax enable
nnoremap \ ,
let mapleader = ','

set visualbell t_vb=
set title
set laststatus=2
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

nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <leader>/ :nohlsearch<cr>

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

match Error /\v\s+$/

autocmd FileType mml nnoremap <leader>m :w<cr>:MmlMake<cr>
