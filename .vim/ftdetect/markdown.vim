" 
" Register the common Markdown file extensions to use the pandoc 
" syntax definition.
"

au! BufRead,BufNewFile *.pdc set filetype=pdc
au! BufRead,BufNewFile *.md set filetype=pdc
au! BufRead,BufNewFile *.mkd set filetype=pdc
au! BufRead,BufNewFile *.markdown set filetype=pdc
au! BufRead,BufNewFile *.mdown set filetype=pdc
