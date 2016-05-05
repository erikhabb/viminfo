if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
cnoremap <C-BS> 
map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
map! <xF1> <F1>
map! <S-Insert> *
imap <C-PageDown> L$
imap <C-PageUp> H
nmap  ggVG$
vmap 	 >'<0v'>$
map  :<Up>
map  :write
vmap  "*d
map <silent> ,bv :VSBufExplorer
map <silent> ,bs :SBufExplorer
map <silent> ,be :BufExplorer
map ;cdpp :call BackgroundMake("CobraDinoPP Debug")
map ;cdlp2 :call BackgroundMake("CobraDinoLP2 Debug")
map ;mpp :call BackgroundMake("MustangPP Debug")
map ;mlp2 :call BackgroundMake("MustangLP2 Debug")
map ;jlp1 :call BackgroundMake("JaguarLP1 Debug")
map ;j64mb :call BackgroundMake("Jaguar64MB Debug")
nmap <silent> ;wb :call SnapshotCM("wset -b -f -q -t. %")
nmap <silent> ;wu :call SnapshotCM("wset -u -f -q -t. %")
nmap <silent> ;wl :call SnapshotCM("wset -l -f -q -t. %")
nmap <silent> ;wci :call SnapshotCM("wci -auto -u %")
nmap <silent> ;wco :call SnapshotCM("wco -l -q -t. %")
nmap <silent> ;wh :!whist -Y %
nmap <silent> ;wd :execute "!start wdiff -P \"" . g:araxisprg . "\" %"
nmap <silent> \` :QFix
nmap <silent> \\ :call BufferList()
nmap <silent> \; :Tlist
nmap <silent> \a :A
nmap \' :execute "Tail " . g:bg_grep_file
nmap \T :IDUtilsBuild
nmap \" :execute "Tail " . g:bg_make_file
nmap \	 :retab
nmap \s <Plug>HiLinkTrace
nmap \<F1> :help jah
nmap \t :CTagsBuild
nmap <silent> \n :set hlsearch!
nmap \/ /\c
nmap \r :source $HOME/.vimrc
nmap <silent> `` :WMToggle
nmap <C-PageUp> H
nmap <C-PageDown> L$
nmap <C-CR> ok 
nmap <S-CR> Oj
vmap <S-Tab> <'<0v'>$
nmap <silent> <F1> <Nop>
nmap <C-F1> :execute "help " . expand("<cword>")
nmap <M-F1> :helptags $VIMFILES/doc
nmap <C-S-Tab> :bprev
nmap <C-Tab> :bnext
nmap <C-S-F5> :call BackgroundCodeGrep("-r -i '" . input("-- ") . "' *")
nmap <C-F5> :call BackgroundCodeGrep("-R -i '<cword>' *")
map <xHome> <Home>
map <xEnd> <End>
map <S-xF4> <S-F4>
map <S-xF3> <S-F3>
map <S-xF2> <S-F2>
map <S-xF1> <S-F1>
map <xF4> <F4>
map <xF3> <F3>
map <xF2> <F2>
map <xF1> <F1>
vmap <C-Del> "*d
vmap <S-Del> "*d
vmap <C-Insert> "*y
vmap <S-Insert> "-d"*P
nmap <S-Insert> "*P
vmap <C-PageDown> L$
vmap <C-PageUp> H
cnoremap  <S-Left>
cnoremap  <S-Right>
cnoremap  
cnoremap  <Left>
cnoremap <NL> <Down>
cnoremap  <Up>
cnoremap  <Right>
cnoremap  <Home>
cnoremap  <S-Right>
map   :simalt ~
nmap ¢ :BGMakeLoad
nmap § :BGGrepLoad
nmap « :call Input("-- ", "ID \"%input%\"")
nmap ¬ :cprev
nmap ® :cnext
nmap ¯ :BGGrep "-R '<cword>' *"
nmap º :call Input("-- ", "BGCodeGrep \"-R '%input%' *\"")
nmap » :BGCodeGrep "-R '<cword>' *"
nmap ½ :ID "<cword>"
nmap ¿ :call Input("-- ", "BGGrep \"-R '%input%' *\"")
nmap Û 
nmap Ü :execute "ptag " . expand("<cword>")
nmap Ý 
nmap û :tprev
nmap ý :tnext
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
set backspace=indent,eol,start
set cpoptions=aABceFsM
set errorformat=\"%f\"\\,\ line\ %l:\ %m
set expandtab
set grepprg=c:\\cygwin\\bin\\grep.exe\ -n
set guifont=Fixedsys:h8:cANSI
set guioptions=gmrLt
set helplang=En
set history=100
set ignorecase
set makeprg=Util\\buildFB_Any.bat
set matchtime=4
set ruler
set scrolloff=2
set sessionoptions=blank,buffers,curdir,folds,options,resize,winpos,winsize,slash,unix
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=2
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
set tabstop=2
set tags=./tags,../tags,tags
set updatetime=500
set viminfo='50,<1000,s100,:0,n$VIMFILES/viminfo
set wildmenu
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd D:\code\Binford\Current\NewChargeXfer
set shortmess=aoO
badd +1 CaptureV2/Preview/LiveViewRenderingChgStatedm420.cpp
badd +1 CaptureV2/Preview/PREVIEWdm320.cpp
badd +195 CaptureV2/Preview/PreviewHighResMosaic.cpp
silent! argdel *
set lines=77 columns=125
winpos 1596 -140
edit CaptureV2/Preview/PreviewHighResMosaic.cpp
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <S-Tab> =KeywordTabWrapper("\\\<C-P\>")
vmap <buffer> <silent> \c :'<,'>s+^+//+
vmap <buffer> <silent> \C :'<,'>s+^//++
inoremap <buffer> 	 =KeywordTabWrapper("\\\<C-N\>")
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal noarabic
setlocal noautoindent
setlocal autoread
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal nocopyindent
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatoptions=croql
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,128-167,224-235
setlocal keymap=
setlocal keywordprg=man
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal readonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=3
setlocal noshortname
setlocal smartindent
setlocal softtabstop=3
setlocal suffixesadd=
setlocal swapfile
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=3
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 195 - ((37 * winheight(0) + 38) / 76)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
195
normal! 0
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . s:sx
endif
let &so = s:so_save | let &siso = s:siso_save
