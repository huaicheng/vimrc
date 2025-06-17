#!/bin/bash

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/plug.vim
source ~/.vim_runtime/vimrcs/basic.vim

try
"source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

# install plugins
vim +PlugInstall +qall

echo "Installed the Basic Vim configuration successfully! Enjoy :-)"
