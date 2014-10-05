let mapleader=","
set nocompatible               " be iMproved
filetype off                   " required!

" Install Vundler with:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'

Plugin 'kien/ctrlp.vim'
map <leader>bb :CtrlPBuffer<CR>
map <leader>tt :CtrlPBufTag<CR>

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
map <leader>tn :NERDTreeToggle <CR>
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'

Plugin 'tomtom/tlib_vim'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plugin 'majutsushi/tagbar'
map <leader>tb :TagbarToggle <CR>

Plugin 'sjl/badwolf'
Plugin 'altercation/vim-colors-solarized'

Plugin 'jamescarr/snipmate-nodejs'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set ttimeoutlen=200

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set mouse=a
set number
set hid " you can change buffers without saving

map <leader>nh :nohlsearch <CR>
nmap <Leader>bi :source ~/.vimrc<CR>:PluginInstall<CR>
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>te :!npm test<CR>

au FileType html                setlocal shiftwidth=2 tabstop=2

syntax on
colorscheme badwolf

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set wildmenu
set wildmode=longest,full

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
set visualbell t_vb=
set nobackup
set noswapfile

set splitbelow
set splitright

set pastetoggle=<F2>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

cmap w!! w !sudo tee % >/dev/null

let g:ctrlp_open_new_file = 'n'
let g:ctrlp_working_path_mode = 'a'


set guioptions-=T
set guioptions-=m

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

set shortmess=a

au BufRead,BufNewFile *.md set filetype=markdown
