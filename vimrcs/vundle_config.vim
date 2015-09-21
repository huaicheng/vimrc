"======================================================
" Vundle managed plugins
"======================================================

"set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'taglist.vim'
Plugin 'mru.vim'
"Plugin 'peaksea'
Plugin 'mattn/emmet-vim'
"Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            
filetype plugin indent on    
