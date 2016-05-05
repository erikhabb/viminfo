" File: jah.vim
" Version: 1.4.1
"
" See ':help jah' for more information.
"   
if exists('g:loaded_jah')
  finish
endif
let g:loaded_jah = 1


" set the default options for the plugin
if !exists("g:jah_Open_BG_Make_On_Results")
  let g:jah_Open_BG_Make_On_Results = 1
endif

if !exists("g:jah_Tail_BG_Make_Results")
  let g:jah_Tail_BG_Make_Results = 0
endif

if !exists("g:jah_Open_BG_Grep_On_Results")
  let g:jah_Open_BG_Grep_On_Results = 1
endif

if !exists("g:jah_Tail_BG_Grep_Results")
  let g:jah_Tail_BG_Grep_Results = 0
endif

if !exists("g:jah_Check_Buffer_List_On_Quit")
  let g:jah_Check_Buffer_List_On_Quit = 0
endif

if !exists("g:jah_Smart_Tab_Completion")
  let g:jah_Smart_Tab_Completion = 1
endif

if !exists("g:jah_Tag_Proto_In_Status")
  let g:jah_Tag_Proto_In_Status = 0
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" M A P P I N G S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" using the quickfix window
nmap <M-,> :cprev<CR>
nmap <M-.> :cnext<CR>

" searching options
nmap \/ /\c
nmap <silent> \n :set hlsearch!<CR>

" using tags and tagfiles
nmap <M-[> <C-T>
nmap <M-]> <C-]>
nmap <M-\> :execute "ptag " . expand("<cword>")<CR>
nmap <M-}> :tnext<CR>
nmap <M-{> :tprev<CR>
nmap \t :CTagsBuild<CR>

" buffer navigation
nmap <C-Tab> :bnext<CR>
nmap <C-S-Tab> :bprev<CR>

" setup the help system
nmap <M-F1> :helptags $VIMFILES/doc<CR>
nmap <C-F1> :execute "help " . expand("<cword>")<CR>
nmap \<F1> :help jah<CR>
nmap <silent> <F1> <Nop>

" miscellaneous
map <C-S> :write<CR>
nmap \s <Plug>HiLinkTrace
nmap \<Tab> :retab<CR>
nmap <C-A> ggVG$

" use tab to indent in visual mode
vmap <Tab> >'<0v'>$
vmap <S-Tab> <'<0v'>$

" windows alt keys
map <M-Space> :simalt ~<CR>

" for compiling and building code
nmap <M-"> :BGMakeLoad<CR>
nmap \" :execute "Tail " . g:bg_make_file<CR>

" using ID utils
nmap <M-=> :ID "<cword>"<CR>
nmap <M-+> :call Input("-- ", "ID \"%input%\"")<CR>
nmap \T :IDUtilsBuild<CR>

" performing background searches
nmap <M-/> :BGGrep "-R '<cword>' *"<CR>
nmap <M-?> :call Input("-- ", "BGGrep \"-R '%input%' *\"")<CR>
nmap <M-;> :BGCodeGrep "-R '<cword>' *"<CR>
nmap <M-:> :call Input("-- ", "BGCodeGrep \"-R '%input%' *\"")<CR>
nmap <M-'> :BGGrepLoad<CR>
nmap \' :execute "Tail " . g:bg_grep_file<CR>

" enter new lines from normal mode
nmap <S-Enter> O<ESC>j
nmap <C-Enter> o<ESC>k 

" plugin windows
nmap <silent> \a :A<CR>
nmap <silent> ;; :SL<CR>
nmap <silent> \; :Tlist<CR>
nmap <silent> \\ :call BufferList()<CR>
nmap <silent> \` :QFix<CR>
nmap <silent> `` :WMToggle<CR>

" command line editing
map <C-K> :<Up>
cnoremap <C-O> <Home>
cnoremap <C-G> <C-E>
cnoremap <C-D> <S-Right><C-W>
cnoremap <C-BS> <C-W>
cnoremap <C-W> <S-Right>
cnoremap <C-B> <S-Left>
cnoremap <C-H> <Left>
cnoremap <C-L> <Right>
cnoremap <C-J> <Down>
cnoremap <C-K> <Up>

" trap quit to prompt if there are buffers not displayed
if g:jah_Check_Buffer_List_On_Quit
"  nnoremap ZZ :call HiddenBufferConfirm("write <Bar> quit")<CR>
"  cnoreabbrev wq call HiddenBufferConfirm("write <Bar> quit")
"  cnoreabbrev q call HiddenBufferConfirm("quit")
"  cnoreabbrev quit call HiddenBufferConfirm("quit")

  augroup jahBufferCheckOnQuit
    autocmd!
    autocmd VimLeavePre * call BufferCheckOnQuit()
  augroup END
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A U T O C O M M A N D S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" used to update the tag status
if g:jah_Tag_Proto_In_Status
  augroup jahTagStatus
    autocmd!
    autocmd CursorHold * call TagStatus_Update()
  augroup END
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C U S T O M   M E N U S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" editing of vim files
menu jah.Vim\ Files.edit\ colors :execute "edit $VIMFILES/colors/" . g:colors . ".vim"<CR>
menu jah.Vim\ Files.edit\ ftplugin :execute "edit $VIMFILES/ftplugin/" . &filetype . "_jah.vim"<CR>
menu jah.Vim\ Files.edit\ plugin :edit $VIMFILES/plugin/jah.vim<CR>
menu jah.Vim\ Files.edit\ vimrc :edit $HOME/.vimrc<CR>
menu jah.Vim\ Files.edit\ help :edit $VIMFILES/doc/jah.txt<CR>
menu jah.Vim\ Files.-Sep1- :
menu jah.Vim\ Files.source\ colors :execute "source $VIMFILES/colors/" . g:colors . ".vim"<CR>
menu jah.Vim\ Files.source\ ftplugin :execute "source $VIMFILES/ftplugin/" . &filetype . "_jah.vim"<CR>
menu jah.Vim\ Files.source\ plugin :unlet g:loaded_jah <Bar> source $VIMFILES/plugin/jah.vim<CR>
menu jah.Vim\ Files.source\ vimrc :source $HOME/.vimrc<CR>
menu jah.Vim\ Files.-Sep2- :
menu jah.Vim\ Files.view\ help \<F1>

" using background utilities
menu <silent> jah.Search.Grep\ All :call MenuInput("Grep Pattern", "BGGrep \"-R '%input%' *\"")<CR>
menu <silent> jah.Search.Grep\ Code :call MenuInput("Grep Code", "BGCodeGrep \"-R '%input%' *\"")<CR>
menu <silent> jah.Search.ID\ Lookup :call MenuInput("Enter ID", "ID \"%input%\"")<CR>
menu jah.Search.-Sep1- :
menu jah.Search.Tail\ Grep\ Results :execute "Tail " . g:bg_grep_file<CR>
menu jah.Search.Load\ Grep\ Results :BGGrepLoad<CR>

" compile menu
menu jah.Compile.Tail\ Make\ Results :execute "Tail " . g:bg_make_file<CR>
menu jah.Compile.Load\ Make\ Results :BGMakeLoad<CR>

" tag files
menu jah.Tagging.Rebuild\ ID\ DB :IDUtilsBuild<CR>
menu jah.Tagging.Rebuild\ Tag\ File :CTagsBuild<CR>

" other stuff
menu jah.-Sep1- :
menu jah.Rebuild\ Help\ Docs <M-F1>

" modify the help menu
menu Help.-jahsep- :
menu Help.jah \<F1>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C O M P I L I N G
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" compile in the background
command! -nargs=1 BGMake call BackgroundMake(<args>)
function! BackgroundMake(args)
  if strlen(a:args) == 0
    return
  endif

  let g:bg_make_file = tempname()
  silent execute "!start /min cmd /c \"" . &makeprg  . " " . a:args  . " >"  . g:bg_make_file . " 2>&1\""
  echo g:bg_make_file

  if g:jah_Tail_BG_Make_Results
    sleep 100 m
    execute "Tail " . g:bg_make_file
  endif

  if g:jah_Open_BG_Make_On_Results
    augroup jah_BG_Make_Results
      autocmd CursorHold * if filewritable(g:bg_make_file) | call OnBGMakeResults() | endif
    augroup END
  endif
endfunction

" loads last background compile
command! -nargs=0 BGMakeLoad call LoadBackgroundMakeResults()
function! LoadBackgroundMakeResults()
  if !exists("g:bg_make_file")
    echohl ErrorMsg | echo "BackgroundMake() must be run first -- result file not found" | echohl None
    return
  endif

  if !filereadable(g:bg_make_file)
    echohl ErrorMsg | echo "Cannot open bg_make_file: " . g:bg_make_file | echohl None
    return
  endif

  " load the error file and popup quickfix
  execute "cgetfile " . g:bg_make_file
  QFix!
endfunction

" opens the make results and closes the preview window
function! OnBGMakeResults()
  autocmd! jah_BG_Make_Results
  augroup! jah_BG_Make_Results
  BGMakeLoad
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" G R E P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" runs a search in the background
command! -nargs=1 BGGrep call BackgroundGrep(<args>)
function! BackgroundGrep(args)
  if strlen(a:args) == 0
    return
  endif

  let g:bg_grep_file = tempname()
  silent execute "!start /min cmd /c \"" . &grepprg . " " . a:args . " >"  . g:bg_grep_file . " 2>&1\""
  echo g:bg_grep_file

  if g:jah_Tail_BG_Grep_Results
    sleep 100 m
    silent execute "Tail " . g:bg_grep_file
  endif

  if g:jah_Open_BG_Grep_On_Results
    augroup jah_BG_Grep_Results
      autocmd CursorHold * if filewritable(g:bg_grep_file) | call OnBGGrepResults() | endif
    augroup END
  endif
endfunction

" runs a search in the background in g:src_files
command! -nargs=1 BGCodeGrep call BackgroundCodeGrep(<args>)
function! BackgroundCodeGrep(args)
  if strlen(a:args) == 0
    return
  endif

  let l:include = substitute(g:src_files, "\\([0-9a-zA-Z]\\+\\)", "--include='*\\\\.\\1'", "g")
  BGGrep l:include . " " . a:args
endfunction

" loads the results of the last background search
command! -nargs=0 BGGrepLoad call LoadBackgroundGrepResults(<args>)
function! LoadBackgroundGrepResults()
  let l:gfm = escape(&grepformat, "\" ")
  let l:efm = escape(&errorformat, "\" ")

  if !exists("g:bg_grep_file")
    echohl ErrorMsg | echo "BackgroundGrep() must be run first -- result file not found" | echohl None
    return
  endif

  if !filereadable(g:bg_grep_file)
    echohl ErrorMsg | echo "Cannot open bg_grep_file: " . g:bg_grep_file | echohl None
    return
  endif

  " we have to reload the errorformat to match grep
  execute "set errorformat=" . l:gfm
  execute "cgetfile " . g:bg_grep_file
  execute "set errorformat=" . l:efm
  QFix!
endfunction

" opens the make results and closes the preview window
function! OnBGGrepResults()
  autocmd! jah_BG_Grep_Results
  augroup! jah_BG_Grep_Results
  BGGrepLoad
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" T A G F I L E S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" rebuild the tag file in the current directory
command! -nargs=0 CTagsBuild call CTagsBuildTagfile()
function! CTagsBuildTagfile()
  echo "ctags rebuild"
  silent execute "!start /min " . g:ctagsprg . " -R"
endfunction

" when called, this will update the command line to show the tag definition
" NOTE: must have taglist plugin installed
function! TagStatus_Update()
  " we need to silently jump to the tag
  let l:col = virtcol('.')
  let l:line = line('.')
  let l:bufnr = bufnr("%")
  let l:pos = SaveScreenPos()
  execute "silent! tag " . expand("<cword>")
  let l:proto = Tlist_Get_Tag_Prototype_By_Line()

  " see if we moved
  if l:col != virtcol('.') || l:line != line('.') || l:bufnr != bufnr("%")
    silent! pop
    execute l:pos
  endif

  " all set!
  if l:proto != ""
    echo l:proto
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I D   U T I L S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" rebuild the id-utils database file
command! -nargs=0 IDUtilsBuild call IDUtilsBuildDB()
function! IDUtilsBuildDB()
  let l:src_files = substitute(g:src_files, "\\([0-9a-zA-Z]\\+\\)", "\\*\\.\\1", "g")
  echo "id-utils rebuild: " . g:src_files
  " silent execute "!start /min cmd /c \"dir /s /b /a-d jam* " . l:src_files . " \| " . g:mkidprg . " \""
  silent execute "!start /min cmd /c \"" . g:mkidprg . " -m " . g:mkidmap . " \""
endfunction

" do a quick search using GNU id-utils
command! -nargs=1 -complete=tag ID call IDUtilsLookup(<args>)
function! IDUtilsLookup(token)
  let g:bg_grep_file = tempname()
  silent execute "!" . g:gidprg . " " . a:token . " >"  . g:bg_grep_file . " 2>&1\""
  BGGrepLoad
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I N P U T   W R A P P E R S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" wrap an input dialog to see if the user hit cancel
function! Input(prompt, exec)
  let l:input = input(a:prompt)
  if l:input != ""
    execute substitute(a:exec, "%input%", l:input, "g")
  endif
endfunction

" wrap an input dialog to see if the user hit cancel
function! MenuInput(prompt, exec)
  let l:input = inputdialog(a:prompt, "", "")
  if l:input != ""
    execute substitute(a:exec, "%input%", l:input, "g")
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" M I S C E L L A N E O U S
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" saves the current screen postition as an executable command
function! SaveScreenPos()
  let l:pos = line(".") . "G" . virtcol(".") . "|"
  let l:screen = "normal "

  " save screen top and bottom
  normal H | let l:screen = l:screen . line(".") . "G"
  normal L | let l:screen = l:screen . line(".") . "G"

  " add line & column to screen top and bottom
  let l:screen = l:screen . l:pos

  execute l:screen
  return l:screen
endfunction

" if the current word is a keyword, insert cmd key, otherwise a <Tab>
function! KeywordTabWrapper(cmd)
  " col() is 1-based
  let l:col = col(".") - 1

  if l:col
    " if the current word is a keyword, complete it
    " for some reason, this must match '\k' not "\k"
    if getline(".")[l:col - 1] =~ '\k'
      execute "return \"" . a:cmd . "\""
    endif
  endif

  " default:
  return "\<Tab>"
endfunction

" if there are hidden buffers, prompt before quitting
function! BufferCheckOnQuit()
  let l:lastbuf = bufnr("$")

  " check for a buffer not being displayed
  let l:idx = 0 | while l:idx <= l:lastbuf | let l:idx = l:idx + 1
    if strlen(bufname(l:idx))
    \ && getbufvar(l:idx, '&modifiable')
    \ && getbufvar(l:idx, '&buflisted')
    \ && bufwinnr(l:idx) < 0
      " found a buffer that is not currently visible
      if confirm("Multiple Buffers Are Open\nReally Quit?", "&Yes\n&No", 2, "Warning") == 1
        qall
      else
        new
        set modified
        hide
      endif

      return
    endif
  endwhile
endfunction 
