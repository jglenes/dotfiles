" General "{{{
set nocompatible    " be iMproved
set autoread
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set so=999
set clipboard+=unnamed
" Modeline
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions
" Buffers
set hidden " The current buffer can be put to the background without writing to disk
" Match and search
set hlsearch    " highlight search
nnoremap <CR> :noh<CR><CR>
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
set incsearch   " Search while typing   
" "}}}

" Formatting "{{{
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

set nowrap
set textwidth=0     " Don't wrap lines by default

set backspace=indent,eol,start  " more powerful backspacing

set tabstop=2    " Set the default tabstop
set softtabstop=4
set shiftwidth=4 " Set the default shift width for indents
set expandtab   " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
syntax on
" "}}}

" Visual "{{{
set number
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set laststatus=2  " Always show status line.
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set cursorline

set splitbelow  " HSplit splits below by default
set splitright  " VSplit splits right by default

set mouse=a
set wildmenu
set wildmode:list,longest,full

" Command and Auto commands " {{{
" Sudo write
comm! W exec 'w !sudo tee % > /dev/null' | e!

" Key mappings " {{{
" Duplication 
vnoremap <silent> <LocalLeader>= yP
nnoremap <silent> <LocalLeader>= YP
" Buffers
nnoremap <silent> <LocalLeader>- :bd<CR>
" New Split
map <silent> <C-W>v :vnew<CR>
map <silent> <C-W>s :snew<CR>

let mapleader="," "  Used for Command-T

" Quick Save
noremap <Leader>s :update<CR>
" Switch between buffers
map ,, <C-^> 
" Easier ESC
imap jj <ESC>
" Swap cursors in iTerm2 for vim modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" }}}

filetype off                   " required for Vundle!

" Plugins " {{{

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'vim-scripts/Vim-R-plugin.git'

" original repos on github
Bundle 'tpope/vim-fugitive.git'
Bundle 'godlygeek/tabular.git'
Bundle 'airblade/vim-gitgutter.git'

" Color Schemes
Bundle 'Lucius'
colorscheme lucius
LuciusDark

" Light Theme For LaTeX
Bundle 'buttercream.vim'


" vim-scripts repos
Bundle 'php.vim'

" Command-t Plugin 
Bundle 'https://github.com/wincent/Command-T.git'
let g:CommandTMatchWindowAtTop=1 " show window at top

" Easy commenting plugin
Bundle 'tComment'
map <leader>/ <c-_><c-_>

" Syntastic
Bundle 'scrooloose/syntastic.git'

" " YouCompleteMe
" Bundle 'Valloric/YouCompleteMe.git'

" Surround
Bundle 'tpope/vim-surround.git'

" Vim .less Syntax Highlighting
Bundle 'groenewege/vim-less.git'

" bufkill lets you clode buffers without closing split/window
Bundle 'bufkill.vim'
filetype plugin indent on     " required!
" " }}}

" OmniCompletion
set omnifunc=syntaxcomplete#Complete

" Powerline
Bundle 'Lokaltog/vim-powerline.git'
set guifont=Monaco\ for\ Powerline:h12
let g:Powerline_symbols = 'fancy'

Bundle 'vim-scripts/vimwiki.git'
nmap <Leader>d <Plug>VimwikiMakeDiaryNote
nmap <Leader>c <Plug>VimwikiToggleListItem

" Vim-LaTeX
Bundle 'gerw/vim-latex-suite.git'

"""""""""""""""
"" Spellchecking
""""""""""""""
 
" if v:version >= 700
"     "Sets in-line spellchecking
"     set spell
"  
"     " Set local language 
"     setlocal spell spelllang=en_us
"     "setlocal spell spelllang=da
" endif

Bundle 'vim-scripts/simple-pairs'
Bundle 'myhere/vim-nodejs-complete'
Bundle 'davidhalter/jedi-vim'
Bundle 'jmcantrell/vim-virtualenv'
let g:virtualenv_auto_activate = 1
