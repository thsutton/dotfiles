" 
" Register the NGinx configuration file to use the correct syntax 
" definition.
"

au! BufRead,BufNewFile nginx.conf set filetype=nginx
