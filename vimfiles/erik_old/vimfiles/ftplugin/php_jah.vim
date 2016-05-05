" for editing php files
if exists("b:jah_ftplugin")
  finish
endif
let b:jah_ftplugin = 1

setlocal formatoptions=croql
setlocal comments=b:#
setlocal cindent

" tab completion mapping
if g:jah_Smart_Tab_Completion
  inoremap <buffer> <Tab>   <C-R>=KeywordTabWrapper("\\\<C-N\>")<CR>
  inoremap <buffer> <S-Tab> <C-R>=KeywordTabWrapper("\\\<C-P\>")<CR>
endif

" comments
map <buffer> <silent> \c mz0i//<ESC>`z
map <buffer> <silent> \C mz0xx`z
vmap <buffer> <silent> \c <ESC>:'<,'>s/^/\/\//<CR>'<
vmap <buffer> <silent> \C <ESC>:'<,'>s/^\/\///<CR>'<
