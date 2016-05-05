" for editing perl files
if exists("b:jah_ftplugin")
  finish
endif
let b:jah_ftplugin = 1

setlocal formatoptions=croql
setlocal cindent
setlocal comments=b:#

" comments
map <buffer> <silent> \c mz0i#<ESC>`z
map <buffer> <silent> \C mz0x`z
vmap <buffer> <silent> \c <ESC>:'<,'>s/^/#/<CR>'<
vmap <buffer> <silent> \C <ESC>:'<,'>s/^#//<CR>'<
