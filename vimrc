let mapleader=","
set nocompatible               " be iMproved
filetype off                   " required!

" Install Vundler with:
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
map <leader>bb :CtrlPBuffer<CR>
map <leader>tt :CtrlPBufTag<CR>

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/zencoding-vim'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdtree'
map <leader>tn :NERDTreeToggle <CR>
Bundle "scrooloose/nerdcommenter"
Bundle "pangloss/vim-javascript"
Bundle "kchmck/vim-coffee-script"
"Bundle "wookiehangover/jshint.vim"
Bundle "scrooloose/syntastic"
Bundle "tpope/vim-surround"
Bundle "mileszs/ack.vim"

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'

Bundle 'majutsushi/tagbar'
map <leader>tb :TagbarToggle <CR>

Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'

python from powerline.bindings.vim import source_plugin; source_plugin()


filetype plugin indent on     " required!

set mouse=a
set number
set hid " you can change buffers without saving

au FileType html                setlocal shiftwidth=2 tabstop=2

syntax on
colorscheme badwolf


set laststatus=2         " always show statusline
let g:Powerline_symbols = 'fancy'

set encoding=utf-8
set list listchars=tab:→\ ,trail:·

set nowrap        " don't wrap lines

set backspace=2

set shiftwidth=2 " number of spaces for autoindentation
set tabstop=2
set smarttab     " insert spaces only at the beginning of the line
set smartindent  " always set smartindenting on
set autoindent   " always set autoindenting on
set expandtab    " use space when <tab> is pressed
" Highlight problematic whitespace (spaces before tabs) {{{
hi RedundantSpaces ctermfg=214 ctermbg=160 cterm=bold
match RedundantSpaces / \+\ze\t/
        
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set pastetoggle=<F2>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

cmap w!! w !sudo tee % >/dev/null

let g:ctrlp_open_new_file = 'n'

set term=screen-256color

set guioptions-=T
set guioptions-=m
