" $Id: omons.vim 20 2007-11-30 00:31:55Z jheddings $
" these are things specific to programming in Omons

" try to find a devroot file
let g:devroot = findfile(".devroot", ".;")
if g:devroot == ""
  let g:devroot = findfile("devroot", ".;")
endif

" if we aren't in a devroot, must not be omons
if g:devroot == ""
  unlet g:devroot
  finish
endif

" just get the folder name for the devroot
let g:devroot = fnamemodify(g:devroot, ":p:h")
let g:omons = 1

" set the include path up to the devroot
execute "set path=include;" . g:devroot

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" adding -e to ant makes output compatible with default efm
set makeprg=ombuild\ -e\ -find\ build.xml

" setup commands for building omons
command! -nargs=* Build :make <args>
command! -nargs=* Rebuild :make -Drebuild=true <args>
command! -nargs=* Compile :make compile <args>
command! -nargs=* Clean :make clean <args>
command! -nargs=* Lint :make static-analysis <args>
