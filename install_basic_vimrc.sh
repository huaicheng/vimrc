#!/bin/bash

[[ -e ~/.vim/bundle/Vundle.vim ]] || mkdir -p ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/vundle_config.vim
source ~/.vim_runtime/vimrcs/basic.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc
vim +PluginInstall +qall

echo "Installed the Basic Vim configuration successfully! Enjoy :-)"
