" ============================================================================
" .vimrc of Philip Stewart (@sodoku)
" ============================================================================
" vim:fdm=marker

set nocompatible               " be iMproved

" Plugins {{{
call plug#begin('~/.vim/plugged')


" General
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'bling/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'szw/vim-ctrlspace'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'christoomey/vim-run-interactive'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'

" Filetypes
Plug 'pangloss/vim-javascript'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'kchmck/vim-coffee-script'
Plug 'evidens/vim-twig'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Colorschemes
Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'

" Archive
" Plug 'jeetsukumaran/vim-filebeagle'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'mattn/emmet-vim'
" Plug 'godlygeek/tabular'
" Plug 'scrooloose/nerdtree'
" Plug 'marijnh/tern_for_vim'
" Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-surround'
" Plug 'thoughtbot/vim-rspec'
" Plug 'jamescarr/snipmate-nodejs'
" Plug 'plasticboy/vim-markdown'
" Plug 'reedes/vim-wordy'
" Plug 'benmills/vimux'
" Plug 'KabbAmine/zeavim.vim'
" Plug 'michalliu/jsruntime.vim'
" Plug 'michalliu/jsoncodecs.vim'
" Plug 'michalliu/sourcebeautify.vim'
" Plug 'maksimr/vim-karma'
" Plug 'severin-lemaignan/vim-minimap'
call plug#end()
" }}}

" Basic Settings {{{

" Leader
let mapleader = ","

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=1000  " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " highlight search terms
set laststatus=2  " Always display the status line
set smarttab      " insert spaces only at the beginning of the line
set smartindent   " always set smartindenting on
set autoindent    " always set autoindenting on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2  " number of spaces for autoindentation
set expandtab     " use space when <tab> is pressed
set shiftround

" Display extra whitespace
set list listchars=tab:→\ ,trail:·,nbsp:·

" Highlight problematic whitespace (spaces before tabs)
hi RedundantSpaces ctermfg=214 ctermbg=160 cterm=bold
match RedundantSpaces / \+\ze\t/


" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 80 characters is
set textwidth=120
set colorcolumn=80

" Numbers
set number
"set numberwidth=5

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Misc
"set shortmess=aoOtI
"set nowrap        " don't wrap lines
"set encoding=utf-8
"set wildignore=*.swp,*.bak,*.pyc,*.class
"set title                " change the terminal's title
"set visualbell t_vb=
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set ttimeoutlen=200
set mouse=a
set hid " you can change buffers without saving
"set wildmenu
"set wildmode=longest,full
set wildmode=list:longest,list:full
"set novisualbell

" GVim
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass,styl setlocal iskeyword+=-
augroup END

" }}}

" Mappings {{{
map <leader>nh :nohlsearch <CR>
nmap <Leader>pi :source ~/.vimrc<CR>:PlugInstall<CR>
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>te :!npm test<CR>
map <Leader><Space> :bn<CR>
"map <C-P> :FZF<CR>

nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" Index ctags from any project
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

cmap w!! w !sudo tee % >/dev/null

set pastetoggle=<F2>
" }}}

" Plugin Settings {{{

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" ----------------------------------------------------------------------------
" UltiSnips
" ----------------------------------------------------------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ----------------------------------------------------------------------------
" Syntastic
" ----------------------------------------------------------------------------
let g:syntastic_javascript_checkers = ['jscs','eslint']
let g:syntastic_coffeescript_checkers = ['coffeelint']

" ----------------------------------------------------------------------------
" Vim Airline
" ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:bufferline_echo = 0
set noshowmode

" ----------------------------------------------------------------------------
" CtrlP
" ----------------------------------------------------------------------------
let g:ctrlp_open_new_file = 'n'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}

function! GitScratch()
    " Set 'gitdir' to be the folder containing .git
    let gitdir=substitute(system("git rev-parse --show-toplevel"), "\n*$", '', '')
    " See if the command output starts with 'fatal' (if it does, not in a git repo)
    let isnotgitdir=matchstr(gitdir, '^fatal:.*')
    " If it empty, there was no error.
    if empty(isnotgitdir)
        exec ":tabedit " gitdir . "/.scratchpad.md"
    else
        echo "Not a git repo"
    endif
endfunction

" Remap to <leader>g for easy use
nnoremap <silent> <leader>sp :call GitScratch()<CR>


function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf ' . keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
