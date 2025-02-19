""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       https://github.com/huaicheng/vimrc
"       Huaicheng Li <lhcwhu@gmail.com>
"
" Sections:
"    -> General settings
"    -> Colors and Fonts
"    -> Status line
"    -> Plugin specfic settings
"    -> Mapping settings
"    -> Autocmds together
"    -> Helper functions
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use vim's keyboard model
set nocompatible

" Wrap lines, instead of only showing partial content
set wrap
" Linebreak at `breakat` characters
set lbr

" Be smart when using tabs ;)
set smarttab
set tabstop=4        " normally, how many spaces a tab counts for
set shiftwidth=4     " # of spaces to use for autoindent, `cindent`, >>, <<, etc
set softtabstop=4    " combine with `expadtab` to use spaces for <TAB>
set expandtab        " in insert mode, tab becomes `tabstop` spaces
set modeline
set modelines=5   " Check first and last 5 lines for modelines

" Disable indent for switch case
"set cinoptions+=:0
" Align function arguments, for more, ``:help cinoptions-values``
"set cino+=(0

" Shortcut to rapidly toggle `set list`
"nmap <leader>' :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬

" Invisible character colors
hi NonText guifg=magenta
hi SpecialKey guifg=magenta


" Enable syntax highlighting, use `enable` instead of `on` to keep yr hi changes
syntax enable

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Don't hide format controlling characters
set conceallevel=0

"set ai "Auto indent
set autoindent
"set cindent
"set si                      "Smart indent, no compatible with `cindent`

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Set language
set langmenu=en_US.UTF-8
set helplang=en

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Enable clipboard for vim in terminals
set clipboard+=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set extra options when running in GUI mode
if has("gui_running")
    "set guioptions-=m                               " hide menu bar
    "set guioptions-=r                               " hide scrollbar
    "set guioptions-=T                               " hide toolbar
    "set guioptions-=e
    "set guioptions-=r
    "set guioptions-=R
    "set guioptions-=l
    "set guioptions-=L

    if has("gui_gtk")                               " for GTK in Linux
        set guifont=Monaco\ 10,Ubuntu\ Mono\ 10
    elseif has("gui_macvim")                        " for MacVim
        set guifont=Monaco\ Nerd\ Font\ Mono:h12
        "set guitablabel=%M\ %t
    elseif has("gui_win32")                         " for Windows
        set guifont=Consolas:h11:cANSI
    endif
endif

set background=dark " mode: dark, light
set termguicolors
colorscheme solarized8
"colorscheme gruvbox " 2nd choice
"let g:gruvbox_italic=1
"colorscheme onedark " 3rd choice
"colorscheme dracula
"colorscheme desert

" Highlight current line, must come after colorscheme
set cursorline

" Line number & color
set number

" Set 80 line marker
set textwidth=80
set cursorcolumn
" fo: t for auto line break after textwidth, a for auto adjust lines
set formatoptions-=t
set colorcolumn=80
set nofoldenable
set foldcolumn=0
"hi ColorColumn ctermbg=black guibg=lightgrey
"hi ColorColumn ctermbg=232 "guibg=DarkGray

" Highlight trailing spaces
"hi ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Set to auto read when a file is changed from the outside
set autoread

" Sets how many lines of history VIM has to remember
set history=500

" Delete warning sound
set vb t_vb=

" Enable folding
set foldenable
set foldcolumn=3
set foldlevel=3
set foldmethod=manual

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the wild menu, command autocompletion
set wildmenu

" Always show current line position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch


" Makes search act like search in modern browsers
set incsearch
" Search highlight: Bright blue
"hi Search ctermfg=0 ctermbg=32 cterm=bold guifg=#002B36 guibg=#268BD2 gui=bold
" Incremental search: High-contrast red
"hi IncSearch ctermfg=0 ctermbg=160 cterm=bold guifg=#002B36 guibg=#DC322F gui=bold
" MatchParen: Distinct violet-blue
"hi MatchParen ctermfg=231 ctermbg=61 cterm=bold guifg=#FFFFFF guibg=#6C71C4 gui=bold
" Visual selection: Foreground (blackish) with light blue background
"hi Visual ctermfg=0 ctermbg=166 guifg=#FDF6E3 guibg=#CB4B16 gui=bold
"hi LineNr ctermfg=240 guifg=#839496
"hi LineNr ctermfg=240 guifg=#586E75

" Don't redraw while executing macros (for performance)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Show time of the match
set matchtime=1

" How many tenths of a second to blink when matching brackets
set mat=2

" Remember info about open buffers on close
set viminfo^=%

" Cscope settings, VIM should be compiled with "--enable-cscope"
if has('cscope')
    " use both cscope and ctags for 'ctrl-]', ':ta', and 'vim -t'
    " set cscopetag
    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-
    endif
    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help
endif
