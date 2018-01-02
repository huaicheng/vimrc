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

" use vim's keyboard model
set nocompatible

"Wrap lines, instead of only showing partial content
set wrap
" Linebreak at `breakat` characters
set lbr

" Be smart when using tabs ;)
set smarttab
set tabstop=4        " normally, how many spaces a tab counts for
set expandtab        " in insert mode, tab becomes `tabstop` spaces
set shiftwidth=4     " # of spaces to use for autoindent, `cindent`, >>, <<, etc
set softtabstop=4    " combine with `expadtab` to use spaces for <TAB>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=m                               " hide menu bar
    set guioptions-=r                               " hide scrollbar
    set guioptions-=T                               " hide toolbar
    set guioptions-=e

    colorscheme desert
    " set cursor color
    highlight Cursor guifg=Black guibg=Green

    if has("gui_gtk")                               " for GTK in Linux
        set guifont=Monaco\ 12,Ubuntu\ Mono\ 12
    elseif has("gui_macvim")                        " for MacVim
        set guifont=Monaco:h12
        set guitablabel=%M\ %t
    elseif has("gui_win32")                         " for Windows
        set guifont=Consolas:h11:cANSI
    endif
else
    " Use tweaked solarized colorscheme in terminal mode
    " Turn this on if your terminal emulator is not using solarized colorscheme
    "let g:solarized_termcolors=256
    try
        set t_Co=256
        set background=dark                             " mode: dark, light
        colorscheme solarized
        "colorscheme desert
    catch
    endtry
endif

" Highlight current line, must come after colorscheme
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=Black

" Line number & color
set number
hi LineNr ctermfg=Darkgrey " ctermbg=Black
hi CursorLineNr term=bold cterm=bold ctermfg=DarkGrey

" Set 80 line marker
set textwidth=80
" fo: t for auto line break after textwidth, a for auto adjust lines
set formatoptions-=t
set colorcolumn=80
hi ColorColumn ctermbg=black guibg=lightgrey

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

"Always show current line position
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
" Always show the status line
set laststatus=2
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%f\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%8*\ %=\ LN:%l/%L\ (%03p%%)\            "Rownumber/total (%)
set statusline+=%9*\ COL:%3c\                            "Colnr

hi User1 ctermbg=Magenta guifg=#ffdad8  guibg=#880c0e
hi User2 ctermbg=DarkYellow guifg=#000000  guibg=#F4905C
hi User3 ctermbg=LightYellow guifg=#292b00  guibg=#f4f597
hi User4 ctermbg=Green guifg=#112605  guibg=#aefe7B
hi User5 ctermbg=Green guifg=#051d00  guibg=#7dcc7d
hi User7 ctermfg=White ctermbg=Magenta cterm=bold guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 ctermfg=White ctermbg=Black guifg=#ffffff  guibg=#5b7fbb
hi User9 ctermfg=White ctermbg=Black guifg=#ffffff  guibg=#810085

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-tex, disable conceal
let g:tex_conceal = ""
let g:tex_flavor = "latex"

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

" Solve mutt's line-break problem (:help formatoptions)
"augroup mail_trailing_whitespace " {
    "autocmd!
    "autocmd FileType mail setlocal formatoptions+=w
"augroup END " }
"setlocal fo+=aw

" Use <space> to open/close the folds
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"map <F3> :tabnew .<CR>
"map <C-F3> \be

" Tagbar settings
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_left = 1
let g:tagbar_width = 15
"let g:tagbar_autoclose=1
let g:tagbar_show_linenumbers = 0
let g:tagbar_compact = 1
let g:tagbar_show_visibility = 0
let g:tagbar_indent = 0
"let g:tagbar_autofocus = 1
" Open tagbar for certain types of files
nnoremap <F8> :TagbarToggle<CR>

" YCM settings
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_collect_identifiers_from_commments_and_strings = 1
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_complete_in_comments = 1
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
"let g:ycm_key_list_previous_comp0letion = ['<c-p>', '<Up>']
"let g:ycm_complete_in_strings = 1
"let g:ycm_show_disgnostics_ui = 0
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|

" Tmux navigator plugin settings
"let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> {c-h} :TmuxNavigateLeft<cr>
"nnoremap <silent> {c-j} :TmuxNavigateDown<cr>
"nnoremap <silent> {c-k} :TmuxNavigateUp<cr>
"nnoremap <silent> {c-l} :TmuxNavigateRight<cr>
"nnoremap <silent> {c-?} :TmuxNavigatePrevious<cr

" Markdown plugin settings
let g:markdown_enable_spell_checking = 0
let g:markdown_enable_input_abbreviations = 0
" disable concealing for italic, bold, inline-code and link
let g:markdown_enable_conceal = 0
"let g:markdown_mapping_switch_status = '<Leader>s'

" Tabular plugin settings
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mapping settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nnoremap <leader>w :w!<cr>
vnoremap Q gq
nnoremap Q gqap

" Move around using visual lines
nnoremap j gj
nnoremap k gk
inoremap <c-u> <esc>viwUea

" Remap ESC
inoremap jj <esc>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :call VisualSelection('f', '')<CR>
"vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close the current buffer
noremap <leader>bd :Bclose<cr>

" Close all the buffers
noremap <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove 
noremap <leader>l :tabnext <cr>
noremap <leader>h :tabprevious<cr>

" Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
"nnoremap <Leader>tl :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
noremap <leader>q :tabnew ~/buffer<cr>

" Quickly open a markdown buffer for scribble
noremap <leader>x :tabnew ~/buffer.md<cr>

" Toggle paste mode on and off
noremap <leader>pp :setlocal paste!<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nnoremap <D-j> <M-j>
  nnoremap <D-k> <M-k>
  vnoremap <D-j> <M-j>
  vnoremap <D-k> <M-k>
endif

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ag, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
"noremap <leader>cc :botright cope<cr>
"noremap <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"noremap <leader>n :cn<cr>
"noremap <leader>p :cp<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
"noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
"noremap <leader>sn ]s
"noremap <leader>sp [s
"noremap <leader>sa zg
"noremap <leader>s? z=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmds together
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrc_autocmd
    autocmd!
    if has("autocmd")
        " Remember last position when exited
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    endif

    " Open tagbar for certain filetypes
    autocmd FileType c,cpp,cxx,h,hpp,py nested :TagbarOpen 

    " Only use cindent for .c files
    autocmd FileType c,cpp,cxx,h,hpp,py set cindent

    " Use 75 chars/line for .tex files
    autocmd FileType tex set tw=75 cc=75

    " Mutt settings
    autocmd BufRead /home/huaicheng/.mutt/tmp/mutt-* set tw=72

    " Auto search and load cscope.out
    autocmd BufEnter /* call LoadCscope()

    " Display .nfo file
    autocmd BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
    autocmd BufReadPost *.nfo call RestoreFileEncodings()
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cscope.out autoloading
function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose             " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction

" For tabular
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Display .NFO files
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction

function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

