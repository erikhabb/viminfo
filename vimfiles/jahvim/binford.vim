" $Id: binford.vim 10 2007-10-24 21:12:22Z jheddings $
" these are things specific to programming in Binford

" Set the current directory to the binford base
let s:curdir = escape(getcwd(), "\" ()")
while !filereadable("binford.cpp")
  cd..
  if strlen(getcwd()) <= 3
    execute "cd " . s:curdir
    break
  endif
endwhile

" Stuff for building FW
set makeprg=Util\buildFB_Any.bat
set errorformat=%E\"%f\"\\,%*[^0-9]%l:\ error\ \#%n%*[^0-9],%Z%m,
               \%W\"%f\"\\,%*[^0-9]%l:\ warning\ \#%n%*[^0-9],%Z%m

" SnapshotCM commands
nmap <silent> ;wd :execute "!start wdiff -P \"" . g:araxisprg . "\" %"<CR><CR>
nmap <silent> ;wh :!whist -Y %<CR><CR>
nmap <silent> ;wco :call SnapshotCM("wco -l -q -t. %")<CR>
nmap <silent> ;wci :call SnapshotCM("wci -auto -u %")<CR>
nmap <silent> ;wl :call SnapshotCM("wset -l -f -q -t. %")<CR>
nmap <silent> ;wu :call SnapshotCM("wset -u -f -q -t. %")<CR>
nmap <silent> ;wb :call SnapshotCM("wset -b -f -q -t. %")<CR>

" shortcuts to build fw
map ;j64mb :call BackgroundMake("Jaguar64MB Debug")
map ;jlp1 :call BackgroundMake("JaguarLP1 Debug")
map ;mlp2 :call BackgroundMake("MustangLP2 Debug")
map ;mpp :call BackgroundMake("MustangPP Debug")
map ;cdlp2 :call BackgroundMake("CobraDinoLP2 Debug")
map ;cdpp :call BackgroundMake("CobraDinoPP Debug")

" Binford Menus
1menu Binford.Build.CobraDinoLP2 ;cdlp2
1menu Binford.Build.CobraDinoPP ;cdpp
1menu Binford.Build.Jaguar64MB ;j64mb
1menu Binford.Build.JaguarLP1 ;jlp1
1menu Binford.Build.MustangLP2 ;mlp2
1menu Binford.Build.MustangPP ;mpp
1menu Binford.Multi :call MULTI()<CR>
1menu Binford.binford\.vim :edit $VIMFILES/binford.vim<CR>

" Find the GHS tools
let g:ghs_tools = $GHS_TOOL_BASE
if exists("$GHS_TOOL_VER")
  let g:ghs_tools = g:ghs_tools . "\\" . $GHS_TOOL_VER
endif
let g:multi = g:ghs_tools . "\\multi.exe"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" wrapper for snapshot commands to bypass gui prompt
function! SnapshotCM(cmd)
  silent execute "!" . a:cmd
  silent edit
  echo a:cmd
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load MULTI on the last built .out file
" NOTE this searches for the first .out file in the build output
function! MULTI()
  " make sure we can find multi.exe
  if !executable(g:multi)
    echohl ErrorMsg | echo "multi.exe could not be found" | echohl None
    return
  endif

  " Find the last binford.out in the current error buffer
  copen
  call search("Link .*binford\.out")
  let s:linkline = getline(".")
  let s:binfout = matchstr(s:linkline, "[^ ]*binford.out")
  cclose

  " make sure we found binford.out
  if strlen(s:binfout) == 0 || !filereadable(s:binfout)
    echohl ErrorMsg | echo "binford.out could not be found" | echohl None
    return
  endif

  " and go...
  silent execute "!start" g:multi . " " . s:binfout
  echo s:binfout
endfunction
