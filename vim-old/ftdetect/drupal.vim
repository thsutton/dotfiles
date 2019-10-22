" 
" Register the various Drupal file extensions for the PHP and configuration
" file syntax definitions.
"

augroup drupal
    au!
    au BufRead,BufNewFile *.profile set filetype=php
    au BufRead,BufNewFile *.install set filetype=php
    au BufRead,BufNewFile *.module set filetype=php
    au BufRead,BufNewFile *.test set filetype=php
    au BufRead,BufNewFile *.info set filetype=ini

    au BufRead,BufNewFile *.profile,*.install,*.module,*.test set sw=2
augroup END
