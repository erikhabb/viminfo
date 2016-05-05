" $Id: funo.vim 23 2008-02-07 04:53:33Z jheddings $

if !exists("g:funo")
  finish
endif

" read omons C syntax
source <sfile>:p:h/../c/funo.vim
