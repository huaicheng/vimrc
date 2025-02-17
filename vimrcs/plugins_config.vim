"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"  This requries that you install https://github.com/coperd/vimrc!
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:linuxsty_patterns = [ "/usr/src/", "~/git/linux" ]

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

" vim-better-whitespace settings
let g:strip_whitespace_confirm=0
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:current_line_whitespace_disabled_soft=1

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

" HCL: gnuplot replot
map , :!gnuplot %<CR>
" :echo 'Current time is ' . strftime('%c')<CR>

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

" Copilot settings
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true











""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
"if has("win16") || has("win32")
    " Don't do anything
"else
    "let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
"endif


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
"ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
"snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeMinimalMenu=1
"let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:multi_cursor_next_key="\<C-s>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="luna" " alternatives: papercolor,
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:goyo_width=100
"let g:goyo_margin_top = 2
"let g:goyo_margin_bottom = 2
"nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_javascript_checkers = ['jshint']

" Custom CoffeeScript SyntasticCheck
func! SyntasticCheckCoffeescript()
    let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
    execute "e " . l:filename
    execute "SyntasticCheck"
    execute "Errors"
endfunc
nnoremap <silent> <leader>l :call SyntasticCheckCoffeescript()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>
