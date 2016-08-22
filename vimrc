" ============================================================================
" .vimrc of Philip Stewart (@sodoku)
" ============================================================================
" vim:fdm=marker

" be iMproved
set nocompatible

" Plugins {{{

  call plug#begin('~/.vim/plugged')

  " General
  Plug 'tpope/vim-unimpaired'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/syntastic'
  Plug 'airblade/vim-gitgutter'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'bling/vim-airline'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tacahiroy/ctrlp-funky'
  Plug 'tpope/vim-fugitive'
  Plug 'mileszs/ack.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'dyng/ctrlsf.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'scrooloose/nerdtree'
  Plug 'justinmk/vim-dirvish'
  Plug 'keith/investigate.vim'

  " Filetypes
  Plug 'sheerun/vim-polyglot' " All the types below combined
  "Plug 'pangloss/vim-javascript'
  "Plug 'digitaltoad/vim-jade'
  "Plug 'wavded/vim-stylus'
  "Plug 'kchmck/vim-coffee-script'
  "Plug 'evidens/vim-twig'
  "Plug 'mxw/vim-jsx'

  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'

  " Snippets
  if has('python') || has('python3')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'ahmedelgabri/vim-ava-snippets'
  endif

  " Colorschemes
  Plug 'sjl/badwolf'
  Plug 'blueyed/vim-colors-solarized'
  Plug 'tomasr/molokai'

  " Archive
  " Plug 'joonty/vdebug'
  " Plug 'Lokaltog/vim-easymotion'
  " Plug 'mattn/emmet-vim'
  " Plug 'godlygeek/tabular'
  " Plug 'marijnh/tern_for_vim'
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

  let mapleader = "," " Leader

  set backspace=2     " Backspace deletes like most programs in insert mode
  set noswapfile      " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
  set nobackup
  set nowritebackup
  set history=1000    " remember more commands and search history
  set undolevels=1000 " use many muchos levels of undo
  set ruler           " show the cursor position all the time
  set cursorline      " highlight current cursor line
  set cursorcolumn    " highlight current cursor column
  set showcmd         " display incomplete commands
  set incsearch       " do incremental searching
  set hlsearch        " highlight search terms
  set laststatus=2    " Always display the status line
  set smarttab        " insert spaces only at the beginning of the line
  set smartindent     " always set smartindenting on
  set autoindent      " always set autoindenting on

  " Softtabs, 2 spaces
  set tabstop=2
  set shiftwidth=2  " number of spaces for autoindentation
  set expandtab     " use space when <tab> is pressed
  set shiftround    " no uneven amount of spaces

  " Display extra whitespace
  set list listchars=tab:→\ ,trail:🕇,nbsp:🕇

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

  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  if &term =~ '256color'
    set t_ut=
  endif

  " Color
  syntax enable
  set background=dark
  colorscheme badwolf

  " Misc
  set ttimeoutlen=200
  set mouse=a
  set hid " you can change buffers without saving
  set wildmode=list:longest,list:full

  " Make netrw show file tree
  let g:netrw_liststyle=3

  " GVim without GUI featurs
  set guioptions-=T
  set guioptions-=m
  set guioptions-=r
  set guioptions-=L
  " Make font look good in GVim
  set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10


  " Git and markdown improvements
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
  map <Leader>nn :bn<CR>

  " Index ctags from any project
  map <Leader>ct :!ctags -R .<CR>

  " Switch between the last two files
  nnoremap <leader><Space> <c-^>

  " Get off my lawn
  nnoremap <Left> :echoe "Use h"<CR>
  nnoremap <Right> :echoe "Use l"<CR>
  nnoremap <Up> :echoe "Use k"<CR>
  nnoremap <Down> :echoe "Use j"<CR>

  " Save file as root
  cmap w!! w !sudo tee % >/dev/null

  set pastetoggle=<F2>
" }}}

" Plugin Settings {{{

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
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:bufferline_echo = 0
  set noshowmode

  " ----------------------------------------------------------------------------
  " CtrlP
  " ----------------------------------------------------------------------------
  let g:ctrlp_working_path_mode = 'a'
  let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))|vendor$'

  " ----------------------------------------------------------------------------
  " NERDTree
  " ----------------------------------------------------------------------------
  let NERDTreeHijackNetrw = 0

  " ----------------------------------------------------------------------------
  " FZF.vim
  " ----------------------------------------------------------------------------
  nnoremap <silent> <Leader><Leader> :Files<CR>
  nnoremap <silent> <Leader>C        :Colors<CR>
  nnoremap <silent> <Leader><Enter>  :Buffers<CR>
  nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
  if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  endif

  " ----------------------------------------------------------------------------
  " Ctrlsf
  " ----------------------------------------------------------------------------
  nmap     <C-F>f <Plug>CtrlSFPrompt
  vmap     <C-F>f <Plug>CtrlSFVwordPath
  vmap     <C-F>F <Plug>CtrlSFVwordExec
  nmap     <C-F>n <Plug>CtrlSFCwordPath
  nmap     <C-F>p <Plug>CtrlSFPwordPath
  nnoremap <C-F>o :CtrlSFOpen<CR>
  nnoremap <C-F>t :CtrlSFToggle<CR>
  inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

  " ----------------------------------------------------------------------------
  " Dirvish
  " ----------------------------------------------------------------------------
  autocmd FileType dirvish call fugitive#detect(@%)
  autocmd FileType dirvish :sort r /[^\/]$/

  " ----------------------------------------------------------------------------
  " vim-jsx
  " ----------------------------------------------------------------------------
  let g:jsx_ext_required = 0

" }}}
