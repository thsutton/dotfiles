set nocompatible
set modeline
set number

" Appearance
set background=dark
set noerrorbells novisualbell t_vb=
set titlestring=%f

" GUI
if has("gui_running")
	set background=light
	set guifont=Menlo:h18
	set mouseshape=n:beam,ve:beam,sd:updown
endif

" Key bindings
nmap <F8> :TagbarToggle<CR>
let mapleader=","
let maplocalleader = g:mapleader

" Globbing
set wildmode=longest,list
set wildignore+=*.swp,*~,*/tmp/*,*/dist/*,*.so,*.o,*.lo,*.a

set nowrap

filetype on
filetype plugin on
filetype plugin indent on
syntax on

let loaded_matchparen=1

" Spelling
set spelllang=en_au
set complete+=kspell

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set nocindent

set tags=./tags;

" C
au FileType c       map ff :%!indent -linux<CR>

" Haskell
au FileType haskell setlocal iskeyword=a-z,A-Z,_,.,39
au FileType haskell map ff :%!stylish-haskell<CR>


"let g:tagbar_type_haskell = {
    "\ 'ctagsbin'  : 'hothasktags',
    "\ 'ctagsargs' : '-c -',
    "\ 'kinds'     : [
        "\  'm:modules:0:1',
        "\  'd:data: 0:1',
        "\  'd_gadt: data gadt:0:1',
        "\  't:type names:0:1',
        "\  'nt:new types:0:1',
        "\  'c:classes:0:1',
        "\  'cons:constructors:1:1',
        "\  'c_gadt:constructor gadt:1:1',
        "\  'c_a:constructor accessors:1:1',
        "\  'ft:function types:1:1',
        "\  'fi:function implementations:0:1',
        "\  'o:others:0:1'
    "\ ],
    "\ 'sro'        : '.',
    "\ 'kind2scope' : {
        "\ 'm' : 'module',
        "\ 'c' : 'class',
        "\ 'd' : 'data',
        "\ 't' : 'type'
    "\ },
    "\ 'scope2kind' : {
        "\ 'module' : 'm',
        "\ 'class'  : 'c',
        "\ 'data'   : 'd',
        "\ 'type'   : 't'
    "\ }
"\ }

" Markdown
au BufRead,BufNewFile *.md  set filetype=markdown
au BufRead,BufNewFile *.txt set filetype=markdown
au BufRead,BufNewFile README set filetype=markdown

au FileType markdown setlocal wrap
au FileType markdown setlocal linebreak
au FileType markdown setlocal nolist
au FileType markdown setlocal textwidth=72
au FileType markdown setlocal spell
let g:pandoc#modules#disabled = ["folding"]

" GIT
let g:gitgutter_sign_column_always = 1
if expand("%:t") == "COMMIT_EDITMSG"
	set textwidth=70
	syn match commitComment "^#.*"
	hi link commitComment Comment
	set noautochdir
	go
endif

" Load plugins
execute pathogen#infect()
