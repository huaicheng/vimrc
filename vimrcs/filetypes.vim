""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def



" HCL: other settings ...
au BufNewFile,BufRead *.plot,*.plt,*.gnuplot,*.gp set ft=gnuplot
au BufNewFile,BufRead *.scala set filetype=scala

au BufNewFile,BufRead *.tex set tw=72 cc=72

" Tex files, default indent 2 spaces
autocmd FileType tex setlocal shiftwidth=2 tabstop=2 expandtab
