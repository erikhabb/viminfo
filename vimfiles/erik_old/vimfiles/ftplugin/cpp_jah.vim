" for c/c++ files
if exists("b:jah_ftplugin")
  finish
endif
let b:jah_ftplugin = 1

setlocal tabstop=3
setlocal softtabstop=3
setlocal shiftwidth=3

setlocal cindent 
setlocal formatoptions=crql
setlocal comments=sr:/*,mb:*,ex:*/,O://
setlocal keywordprg=man

" comments
vmap <buffer> <silent> \c :s+^+//+<CR>
vmap <buffer> <silent> \C :s+^//++<CR>
vmap <buffer> <silent> \c <ESC>:'<,'>s+^+//+<CR>
vmap <buffer> <silent> \C <ESC>:'<,'>s+^//++<CR>

" tab completion mapping
if g:jah_Smart_Tab_Completion
  inoremap <buffer> <Tab>   <C-R>=KeywordTabWrapper("\\\<C-N\>")<CR>
  inoremap <buffer> <S-Tab> <C-R>=KeywordTabWrapper("\\\<C-P\>")<CR>
endif

" define some c syntax stuff
syn match Brackets /[{}[\]()<>]/
"syn match Function /[a-zA-Z][a-zA-Z0-9_] *(/
syn match Relation /==|!=|<=|>=/
