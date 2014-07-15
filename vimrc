set number

set wildmode=longest,list

filetype plugin on
syntax on
let loaded_matchparen=1

set background=dark
set noerrorbells visualbell t_vb=

if has("gui_running")
	set background=light
	set guifont=Monospace\ 18
	set visualbell
	set t_vb=
endif

" Key bindings
nmap <F8> :TagbarToggle<CR>

if expand("%:e") == "hs"
    set tabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent
    set smartindent
    set nocindent
    set softtabstop=4

    " Per http://hackage.haskell.org/package/hothasktags
    set iskeyword=a-z,A-Z,_,.,39
endif

au BufRead,BufNewFile *.md  set filetype=markdown
au BufRead,BufNewFile *.txt set filetype=markdown

if expand("%:t") == "COMMIT_EDITMSG"
	set textwidth=70
	syn match commitComment "^#.*"
	hi link commitComment Comment
	set noautochdir
	go
endif

" Spelling
set spelllang=en_au
set complete+=kspell
au FileType markdown setlocal spell

execute pathogen#infect()
