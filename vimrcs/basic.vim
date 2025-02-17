""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Huaicheng Li <lhcwhu@gmail.com>
" Note that this repo is forked from amix's vimrc, but has been changed greatly.
"
"       https://github.com/huaicheng/vimrc
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

"set cinoptions=l1
"set cinoptions=p0,t0,:4,=0
"set cinwords=if,else,switch,case,for,while,do

" Disable indent for switch case
"set cinoptions+=:0
" Align function arguments, for more, ``:help cinoptions-values``
"set cino+=(0

" Shortcut to rapidly toggle `set list`
"nmap <leader>h :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬

" Invisible character colors
hi NonText guifg=magenta
hi SpecialKey guifg=magenta


" Enable syntax highlighting, use `enable` instead of `on` to keep yr hi changes
if !exists("g:syntax_on")
    syntax enable
endif

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
    set guioptions-=m                               " hide menu bar
    set guioptions-=r                               " hide scrollbar
    set guioptions-=T                               " hide toolbar
    set guioptions-=e
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L

    if has("gui_gtk")                               " for GTK in Linux
        set guifont=Monaco\ 10,Ubuntu\ Mono\ 10
    elseif has("gui_macvim")                        " for MacVim
        set guifont=Monaco\ Nerd\ Font\ Mono:h12
        "set guitablabel=%M\ %t
    elseif has("gui_win32")                         " for Windows
        set guifont=Consolas:h11:cANSI
    endif
endif

" Use tweaked solarized colorscheme in terminal mode
" Turn this on if your terminal emulator is not using solarized colorscheme
"let g:solarized_termcolors=256
set background=dark " mode: dark, light
set termguicolors
"colorscheme solarized " 1st choice
"colorscheme gruvbox " 2nd choice
"let g:gruvbox_italic=1
colorscheme onedark " 3rd choice
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
hi Search ctermfg=0 ctermbg=32 cterm=bold guifg=#002B36 guibg=#268BD2 gui=bold
" Incremental search: High-contrast red
hi IncSearch ctermfg=0 ctermbg=160 cterm=bold guifg=#002B36 guibg=#DC322F gui=bold
" MatchParen: Distinct violet-blue
hi MatchParen ctermfg=231 ctermbg=61 cterm=bold guifg=#FFFFFF guibg=#6C71C4 gui=bold

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not always show the status line
"set laststatus=1
"if has("gui_running")
"    set laststatus=2
"    set statusline=
"    set statusline+=%7*\[%n]                                  "buffernr
"    set statusline+=%1*\ %<%f\                                "File+path
"    set statusline+=%2*\ %y\                                  "FileType
"    set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
"    set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"    set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..)
"    set statusline+=%8*\ %=\ LN:%l/%L\ (%03p%%)\              "Rownumber/total (%)
"    set statusline+=%9*\ COL:%3c\                             "Colnr

"    hi User1 ctermbg=Magenta guifg=#ffdad8  guibg=#880c0e
"    hi User2 ctermbg=DarkYellow guifg=#000000  guibg=#F4905C
"    hi User3 ctermbg=LightYellow guifg=#292b00  guibg=#f4f597
"    hi User4 ctermbg=Blue guifg=#112605  guibg=#aefe7B
"    hi User5 ctermbg=Green guifg=#051d00  guibg=#7dcc7d
"    hi User7 ctermfg=White ctermbg=Magenta cterm=bold guifg=#ffffff  guibg=#880c0e gui=bold
"    hi User8 ctermfg=White ctermbg=Green guifg=#ffffff guibg=#5b7fbb
"    hi User9 ctermfg=White ctermbg=Cyan guifg=#ffffff guibg=#810085
"endif


" Function to adjust cursor highlight based on colorscheme
function! AdjustCursorHighlight()
    if !exists('g:colors_name') || g:colors_name == ''
        let g:colors_name = expand('<amatch>') " Ensure it's always set
    endif
    set foldcolumn=0

    if g:colors_name ==# 'solarized'
        hi CursorLine ctermbg=235 guibg=#073642
        hi CursorColumn ctermbg=235 guibg=#073642
        hi ColorColumn ctermbg=234 guibg=#073642
        hi CursorLineNr ctermbg=169 guibg=#D33682
        hi FoldColumn guibg=NONE ctermbg=NONE
        " Search highlight: Bright blue
        hi Search ctermfg=0 ctermbg=32 cterm=bold guifg=#002B36 guibg=#268BD2 gui=bold
        " Incremental search: High-contrast red
        hi IncSearch ctermfg=0 ctermbg=160 cterm=bold guifg=#002B36 guibg=#DC322F gui=bold
        " MatchParen: Distinct violet-blue
        hi MatchParen ctermfg=231 ctermbg=61 cterm=bold guifg=#FFFFFF guibg=#6C71C4 gui=bold
    elseif g:colors_name ==# 'onedark'
        hi CursorLine   ctermbg=236 guibg=#2c323c
        hi CursorColumn ctermbg=236 guibg=#2C323C
        hi ColorColumn  ctermbg=236 guibg=#2C323C
        hi LineNr ctermfg=240 guifg=#839496
    endif
endfunction

" Manually define g:colors_name if it's missing
if !exists('g:colors_name') || g:colors_name == ''
    let g:colors_name = 'solarized'
endif

" Call the function AFTER setting colorscheme
call AdjustCursorHighlight()

" Ensure it runs automatically when changing colorschemes
autocmd ColorScheme * let g:colors_name = expand('<amatch>') | call AdjustCursorHighlight()
