set shell=/bin/bash

call plug#begin('~/.vim/plugged')

" Plug 'ElmCast/elm-vim'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'ap/vim-css-color'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'elixir-lang/vim-elixir'
" Plug 'elzr/vim-json'
" Plug 'ervandew/supertab'
" Plug 'fatih/vim-go'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'
" Plug 'https://bitbucket.org/kisom/eink.vim.git'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'justinj/vim-react-snippets'
" Plug 'keith/swift.vim'
" Plug 'lambdatoast/elm.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'neovimhaskell/haskell-vim'
" Plug 'pangloss/vim-javascript'
" Plug 'rhysd/vim-crystal'
" Plug 'robertmeta/nofrils'
" Plug 'rust-lang/rust.vim'
" Plug 'scrooloose/syntastic'
" Plug 'skwp/vim-rspec'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'tjennings/git-grep-vim'
" Plug 'tomtom/tlib_vim'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-git'
" Plug 'tpope/vim-markdown'
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-sleuth'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-unimpaired'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-ruby/vim-ruby'
Plug 'airblade/vim-gitgutter'
Plug 'aliva/vim-fish'
Plug 'bogado/file-line'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'

call plug#end()

" settings

colorscheme seoul256

syntax enable filetype plugin indent on

set lazyredraw

" whitespace

set tabstop=2 shiftwidth=2 expandtab
set autoindent smartindent
set nowrap
set backspace=indent,eol,start

set list listchars=tab:▸\ ,trail:·,extends:→,precedes:←

" search
set hlsearch incsearch ignorecase smartcase
nnoremap <cr> :nohlsearch<cr><cr>

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']

" context
" set cursorline
set colorcolumn=80
" highlight ColorColumn ctermbg=235
set scrolloff=3
set showcmd

" completion
set wildmenu wildmode=list:longest,full

" remember
set undofile undodir=~/.vim/tmp
set backup backupdir^=~/.vim/tmp
set directory^=~/.vim/tmp

" statusline
set laststatus=2

let g:airline_left_sep = ' '
let g:airline_right_sep = ' '

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_theme = 'base16'

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

" mappings

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" bubble single lines
nmap <c-k> [e
nmap <c-j> ]e

" bubble multiple lines
vmap <c-k> [egv
vmap <c-j> ]egv

cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <esc>b <s-left>
cnoremap <esc>f <s-right>
cnoremap <c-f> <right>
cnoremap <c-b> <left>

map <leader>r :!clear;make<cr>

" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <c-r>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

autocmd BufNewFile,BufRead .eslintrc set filetype=json

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

set mouse=a

" GitGrep.vim

map <leader>f :GitGrep<space>""<space><left><left>

" GitGutter.vim

let g:gitgutter_enabled = 0
nmap <leader>g :GitGutterToggle<cr>

" Syntastic

nmap <leader>s :SyntasticToggleMode<cr>

" Elm

let g:elm_format_autosave = 1
