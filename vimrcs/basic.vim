""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Huaicheng Li <lhcwhu@gmail.com>
" Note that this repo is forked from amix's vimrc, but has been changed greatly.
"
"       https://github.com/huaicheng/vimrc
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead /home/huaicheng/.mutt/tmp/mutt-* set tw=72

let g:tex_conceal = ""

" Sets how many lines of history VIM has to remember
set history=500

" Add my own settings

" Remember last position when exited
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
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
au BufEnter /* call LoadCscope()

" Delete warning sound
set vb t_vb=

" Solve mutt's line-break problem (:help formatoptions)
augroup mail_trailing_whitespace " {
    autocmd!
    autocmd FileType mail setlocal formatoptions+=w
augroup END " }
"setlocal fo+=aw

" Enable folding
set foldenable 
set foldcolumn=3
set foldlevel=3
set foldmethod=manual

" Use <space> to open/close the folds
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
map <F3> :tabnew .<CR>
map <C-F3> \be

" Set the C language autoindent
set smartindent

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
autocmd FileType c,cpp,cxx,h,hpp,py nested :TagbarOpen 
nmap <F8> :TagbarToggle<CR>

" YCM settings
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_commments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_comp0letion = ['<c-p>', '<Up>']
let g:ycm_complete_in_strings = 1
let g:ycm_show_disgnostics_ui = 0
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" |
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|

" tmux related settings
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

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

noremap <f2> =a{
"colo desert
"colo desert
se ru nu ar sw=4 ts=4 noswf et sta nowrap ww=<,>,[,] gfn="YaHei Consolas Hybrid":h12
"autocmd BufEnter * lcd %:p:h

" Enable filetype plugins
filetype off
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
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

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" use vim's keyboard model
set nocompatible

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" Show time of the match
set matchtime=1

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
autocmd! GUIEnter * set vb t_vb=

" Add a bit extra margin to the left


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Remove error sound
set noeb

" Use solarized colorscheme
try
    set t_Co=256
    syntax enable
    set background=dark                             " mode: dark, light
    colorscheme solarized
catch
endtry

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=m                               " hide menu bar
    set guioptions-=r                               " hide scrollbar
    set guioptions-=T                               " hide toolbar
    set guioptions-=e

    set t_Co=256
    " set cursor color
    highlight Cursor guifg=Black guibg=Green

    if has("gui_gtk2")                              " for GTK2 in Linux
        set guifont=Monaco\ 12
    elseif has("gui_macvim")                        " for MacVim
        set guifont=Monaco:h14
        set guitablabel=%M\ %t
    elseif has("gui_win32")                         " for Windows
        set guifont=Consolas:h11:cANSI
    endif
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencodings=ucs-bom,utf-8,cp936,gbk,big5,latin1,euc-kr,euc-jp
" Set language
set langmenu=en_US.UTF-8
set helplang=en

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Highlight current line, must come after colorscheme
set cursorline
hi CursorLine term=bold cterm=bold ctermbg=Black

" Line number & color
set number
hi LineNr ctermbg=Black ctermfg=Darkgrey
hi CursorLineNr term=bold cterm=bold ctermfg=White

" Set 80 line marker
set textwidth=80
" fo: t for auto line break after textwidth, a for auto adjust lines
set formatoptions-=t
set colorcolumn=80


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr

"set ai "Auto indent
set autoindent
set cindent
set si                      "Smart indent
set wrap                    "Wrap lines


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


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
set statusline+=%8*\ %=\ LN:%04l/%L\ (%03p%%)\            "Rownumber/total (%)
set statusline+=%9*\ COL:%03c\                            "Colnr

hi User1 ctermbg=Magenta guifg=#ffdad8  guibg=#880c0e
hi User2 ctermbg=DarkYellow guifg=#000000  guibg=#F4905C
hi User3 ctermbg=LightYellow guifg=#292b00  guibg=#f4f597
hi User4 ctermbg=Green guifg=#112605  guibg=#aefe7B
hi User5 ctermbg=Green guifg=#051d00  guibg=#7dcc7d
hi User7 ctermfg=White ctermbg=Magenta cterm=bold guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 ctermfg=White ctermbg=Black guifg=#ffffff  guibg=#5b7fbb
hi User9 ctermfg=White ctermbg=Black guifg=#ffffff  guibg=#810085

" Don't hide format controlling characters
set conceallevel=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ag and put the cursor in the right position
map <leader>g :Ag 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

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
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
