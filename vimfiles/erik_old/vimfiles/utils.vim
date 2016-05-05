" some utility functions

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggles the quickfix window.
function! QFixToggle()
  " easy way out (as opposed to scanning all the open buffers)
  if exists("g:qfix_win")
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" compile in the background
function! BackgroundMake(args)
  let g:bg_make_file = tempname()
  silent execute "!start cmd /c \"" . &makeprg  . " " . a:args  . " >"  . g:bg_make_file . " 2>&1\""
  echo g:bg_make_file
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" loads the results of the last background compile
function! LoadBackgroundMakeResults()
  if !exists("g:bg_make_file")
    echohl ErrorMsg | echo "BackgroundMake() must be run first" | echohl None
    return
  endif

  if !filereadable(g:bg_make_file)
    echohl ErrorMsg | echo "Cannot open bg_make_file: " . g:bg_make_file | echohl None
    return
  endif

  " load the error file
  execute "cgetfile " . g:bg_make_file

  " ensure that quickfix is up
  if !exists("g:qfix_win")
    call QFixToggle()
  endif
  copen
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" runs a search in the background
function! BackgroundGrep(args)
  let g:bg_grep_file = tempname()
  silent execute "!start cmd /c \"" . &grepprg . " " . a:args . " >"  . g:bg_grep_file . " 2>&1\""
  echo g:bg_grep_file
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" loads the results of the last background search
function! LoadBackgroundGrepResults()
  let l:gfm = escape(&grepformat, "\" ")
  let l:efm = escape(&errorformat, "\" ")

  if !exists("g:bg_grep_file")
    echohl ErrorMsg | echo "BackgroundGrep() must be run first" | echohl None
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

  if !exists("g:qfix_win")
    call QFixToggle()
  endif
  copen
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" runs a search in the background, only in source code files
function! BackgroundCodeGrep(args)
  let l:include = substitute(g:src_files, "\\([0-9a-zA-Z]\\+\\)", "--include='*\\\\.\\1'", "g")
  call BackgroundGrep(l:include . " " . a:args)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" monitors the file and updates a "busy" indicator until the file is writable
function! BackgroundFileMonitor(file)
  let g:bg_file_monitor = "|"
  while !filewritable(a:file)
    if g:bg_file_monitor == "|"
      let g:bg_file_monitor = "/"
    elseif g:bg_file_monitor == "/"
      let g:bg_file_monitor = "-"
    elseif g:bg_file_monitor == "-"
      let g:bg_file_monitor = "\\"
    elseif g:bg_file_monitor == "\\"
      let g:bg_file_monitor = "|"
    endif
    echo g:bg_file_monitor
    1sleep
  endwhile
  echohl ErrorMsg | echo "file is done" | echohl None
  unlet g:bg_file_monitor
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rebuild the tag file in the current directory
function! CTagsBuildTagfile()
  echo "ctags rebuild"
  silent execute "!start ctags -R"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rebuild the id-utils database file in the current directory
function! IDUtilsBuildDB()
  let l:src_files = substitute(g:src_files, "\\([0-9a-zA-Z]\\+\\)", "\\*\\.\\1", "g")
  echo "id-utils rebuild: " . g:src_files
  silent execute "!start cmd /c \"dir /s /b /a-d " . l:src_files . " \| mkid -\""
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" do a quick search using GNU id-utils
function! IDUtilsLookup(token)
  let g:bg_grep_file = tempname()
  silent execute "!gid " . a:token . " >"  . g:bg_grep_file . " 2>&1\""
  call LoadBackgroundGrepResults()
endfunction
