" colors
let g:colors = "erikColors2"

" font
set guifont=Fixedsys:h8:cANSI

" searching
set noincsearch
set nohlsearch
set ic  " no case sensitive search

" program locations
" idutils files are from djgpp 
" need to install base djgpp installation for these to work
" ctags is latest exuberant ctags
set grepprg=c:\cygwin\bin\grep.exe\ -n
let g:mkidprg='c:\idutils\mkid.exe'
let g:mkidmap='c:\idutils\id-lang.map'
let g:gidprg='c:\idutils\gid.bat'
let g:ctagsprg='c:\PROGRA~1\ctags57\ctags.exe'

" searching
nmap <C-F5> :call BackgroundCodeGrep("-R -i '<cword>' *")<CR>
nmap <C-S-F5> :call BackgroundCodeGrep("-r -i '" . input("-- ") . "' *")<CR>

" winmanager
nmap <silent> `` :WMToggle<CR>

" reset colors
execute "colors " . g:colors

" sessions
set sessionoptions=blank,buffers,curdir,resize,winpos,winsize,slash,unix,localoptions

