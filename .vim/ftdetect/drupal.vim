" 
" Register the various Drupal file extensions for the PHP and configuration
" file syntax definitions.
"

au! BufRead,BufNewFile *.profile set filetype=php
au! BufRead,BufNewFile *.install set filetype=php
au! BufRead,BufNewFile *.module set filetype=php
au! BufRead,BufNewFile *.test set filetype=php
au! BufRead,BufNewFile *.info set filetype=dosini
