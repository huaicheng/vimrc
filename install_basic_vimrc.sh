#!/bin/bash

VundleDir=~/.vim/bundle/Vundle.vim

[[ -e $VundleDir ]] || mkdir -p $VundleDir
git clone https://github.com/VundleVim/Vundle.vim.git $VundleDir

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/vundle_config.vim
source ~/.vim_runtime/vimrcs/basic.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

# install plugins
vim +PluginInstall +qall

echo "Installed the Basic Vim configuration successfully! Enjoy :-)"
