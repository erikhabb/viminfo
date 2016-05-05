" for editing vim files
if exists("b:jah_ftplugin")
  finish
endif
let b:jah_ftplugin = 1

setlocal formatoptions=crql
setlocal comments=b:\"

" tab completion mapping
if g:jah_Smart_Tab_Completion
  inoremap <buffer> <Tab>   <C-R>=KeywordTabWrapper("\\\<C-N\>")<CR>
  inoremap <buffer> <S-Tab> <C-R>=KeywordTabWrapper("\\\<C-P\>")<CR>
endif

" vim comments
map <buffer> <silent> \c mz0i"<ESC>`z
map <buffer> <silent> \C mz0x`z
vmap <buffer> <silent> \c :s/^/"<CR>
vmap <buffer> <silent> \C :s/^"//<CR>
