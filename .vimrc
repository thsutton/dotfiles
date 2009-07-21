" Behaviour
set nocompatible
set backspace=indent,eol,start
set wrapmargin=2
set wildmode=longest,list,full
set wildmenu

" Indentation
set smartindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

set ruler
set number
set printoptions=number:y
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set background=dark

set autoindent

" File-types and syntax
filetype on
filetype plugin on
filetype indent on
syntax on

" Jump to last position in files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal g'\"" | endif
