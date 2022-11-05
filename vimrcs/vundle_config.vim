"===============================================================================
"                         Vundle managed plugins
"===============================================================================

"set nocompatible               " be iMproved, required
"filetype off                   " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'scrooloose/nerdtree'
"Plugin 'kien/ctrlp.vim'                    " Fuzzy file, buffer, mru, tag, etc
"Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
"Plugin 'mru.vim'                           " access to a list of recently opened files
Plugin 'DrawIt'
"Plugin 'peaksea'
"Plugin 'mattn/emmet-vim'                   " for html/css dev
"Plugin 'bling/vim-airline'
"Plugin 'tpope/vim-fugitive'                 " git wrapper, **TO LEARN**
"Plugin 'tpope/vim-markdown'                " use native vim markdown feature now
Plugin 'gabrielelana/vim-markdown'
"Plugin 'brookhong/cscope.vim'              " automatic cscope db management, autoupdate cscope.out, **TO LEARN**
Plugin 'cscope_macros.vim'                  " basic cscope settings & mapping
"Plugin 'nathanaelkane/vim-indent-guides'    " visually displaying indent levels
"Plugin 'Yggdroot/indentLine'
"Plugin 'lervag/vimtex'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'altercation/solarized'
"Plugin 'lifepillar/vim-solarized8'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
Plugin 'godlygeek/tabular'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vivien/vim-linux-coding-style'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'derekwyatt/vim-scala'
"Plugin 'vim-scripts/scala.vim'
"Plugin 'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
