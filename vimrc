set nocompatible
set backspace=indent,eol,start

if has("vms")
  set nobackup " do not keep a backup file, use versions instead
else
  set backup   " keep a backup file
endif

set history=100
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" Custom

set et sw=2 sts=2
" set list
" set smartindent
set nocp
set nobk

" Make ',e' (in normal mode) give a prompt for opening files
" in the same dir as the current buffer's file.
if has("unix")
  map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
  map ,e :e <C-R>=expand("%:p:h") . "\\" <CR>
endif

" Map FuzzyFinderTextMate to '\t'
map <leader>t :FuzzyFinderTextMate<CR>
map ,t :ruby finder.rescan!<CR>

set hidden
nnoremap ' `
nnoremap ` '
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set title
set scrolloff=3
set backupdir=/var/tmp
set directory=/var/tmp
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
set list
set listchars=tab:··,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
set shortmess=atI
set visualbell

" Customize here: http://vim.wikia.com/wiki/VimTip24
let w:m1=matchadd('Search', '\%<81v.\%>80v', -1)
let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>80v', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Git updates are OK
set autoread

" Emacs like movement in insert mode
map! <C-A> <Home>
map! <C-E> <End>
