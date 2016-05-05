" $Id: omons.vim 20 2007-11-30 00:31:55Z jheddings $

if !exists("g:omons")
  finish
endif

" read omons C syntax
source <sfile>:p:h/../c/omons.vim
