let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
cnoremap <C-BS> 
map! <S-Insert> <MiddleMouse>
nmap  ggVG$
vmap 	 >'<0v'>$
map  :<Up>
map  :write
map <silent> ,bv :VSBufExplorer
map <silent> ,bs :SBufExplorer
map <silent> ,be :BufExplorer
nmap <silent> ;; :SL
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
nmap <silent> `` :WMToggle
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nmap <C-CR> ok 
nmap <S-CR> Oj
vmap <S-Tab> <'<0v'>$
nmap <silent> <F1> <Nop>
nmap <C-F1> :execute "help " . expand("<cword>")
nmap <M-F1> :helptags $VIMFILES/doc
nmap <C-S-Tab> :bprev
nmap <C-Tab> :bnext
map <S-Insert> <MiddleMouse>
cnoremap  <S-Left>
cnoremap  <S-Right>
cnoremap  
cnoremap  <Left>
cnoremap <NL> <Down>
cnoremap  <Up>
cnoremap  <Right>
cnoremap  <Home>
cnoremap  <S-Right>
nmap § :BGGrepLoad
nmap º :call Input("-- ", "BGCodeGrep \"-R '%input%' *\"")
nmap » :BGCodeGrep "-R '<cword>' *"
nmap ¿ :call Input("-- ", "BGGrep \"-R '%input%' *\"")
nmap ¯ :BGGrep "-R '<cword>' *"
nmap « :call Input("-- ", "ID \"%input%\"")
nmap ½ :ID "<cword>"
nmap ¢ :BGMakeLoad
map   :simalt ~
nmap ® :cnext
nmap ¬ :cprev
nmap û :tprev
nmap ý :tnext
nmap Ü :execute "ptag " . expand("<cword>")
nmap Ý 
nmap Û 
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set grepprg=grep.exe\ -n
set guifont=Courier_New:h8:cANSI
set guioptions=gmrLt
set helplang=en
set history=100
set hlsearch
set ignorecase
set incsearch
set matchtime=4
set mouse=a
set printoptions=paper:letter
set ruler
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set scrolloff=2
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=2
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=2
set tags=./tags,../tags,tags
set termencoding=utf-8
set updatetime=500
set viminfo='50,<1000,s100,:0,n$VIMFILES/viminfo
set wildmenu
set window=56
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 mp3/Dean\ Gray/American\ Edit/songlist
badd +1 d:/images/2005/11192005_dirkpianoparty/unk
silent! argdel *
edit mp3/Dean\ Gray/American\ Edit/songlist
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal noautoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != ''
setlocal filetype=
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
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
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
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal smartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != ''
setlocal syntax=
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
