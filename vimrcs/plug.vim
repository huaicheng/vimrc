"===============================================================================
"                         vim-plug managed plugins
"===============================================================================

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Reuse the bundle/ folder for vim-plug manged plugins
call plug#begin('~/.vim/bundle')

Plug 'junegunn/vim-plug'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'kien/ctrlp.vim'                    " Fuzzy file, buffer, mru, tag, etc
Plug 'vim-scripts/taglist.vim', { 'on': 'Tlist' }
Plug 'majutsushi/tagbar'
"Plugin 'mru.vim'                           " access to a list of recently opened files
Plug 'vim-scripts/DrawIt'
"Plug 'vim-scripts/peaksea'
"Plug 'mattn/emmet-vim'                   " for html/css dev
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'                 " git wrapper, **TO LEARN**
"Plug 'tpope/vim-markdown'                " use native vim markdown feature now
Plug 'gabrielelana/vim-markdown'
"Plug 'brookhong/cscope.vim'              " automatic cscope db management, autoupdate cscope.out, **TO LEARN**
Plug 'vim-scripts/cscope_macros.vim'                  " basic cscope settings & mapping
"Plug 'nathanaelkane/vim-indent-guides'    " visually displaying indent levels
"Plug 'Yggdroot/indentLine'
Plug 'altercation/vim-colors-solarized'
"Plug 'altercation/solarized'
"Plug 'lifepillar/vim-solarized8'
Plug 'SirVer/ultisnips', { 'on': [] }
Plug 'valloric/youcompleteme', { 'on': [] }
"Plug 'rdnetto/YCM-Generator'
Plug 'godlygeek/tabular'
Plug 'justinmk/vim-syntax-extra'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vivien/vim-linux-coding-style'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'derekwyatt/vim-scala'
"Plug 'vim-scripts/scala.vim'
Plug 'lervag/vimtex'
Plug 'github/copilot.vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'
"Plug 'sheerun/vim-polyglot', { 'for': ['c', 'cpp', 'html', 'css'] }
Plug 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call plug#end()

" Defer loading ultisnips and YouCompleteMe when entering insert mode
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
                     \| autocmd! load_us_ycm
augroup END
