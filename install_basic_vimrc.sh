git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cat ~/.vim_runtime/vimrcs/vundle_config.vim > ~/.vimrc
cat ~/.vim_runtime/vimrcs/basic.vim >> ~/.vimrc
vim +PluginInstall +qall
echo "Installed the Basic Vim configuration successfully! Enjoy :-)"
