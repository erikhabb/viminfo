" try to stick the the built-in commands whenever possible, but....

" allow easy re-sourcing and editing of my files
nmap \e :edit $HOME/.vimrc<CR>
nmap \r :source $HOME/.vimrc<CR>
nmap \E :execute "edit $VIMFILES/ftplugin/" . &filetype . "_jah.vim"<CR>
nmap \p :execute "edit $VIMFILES/colors/" . g:colors . ".vim"<CR>
nmap \P :execute "source $VIMFILES/colors/" . g:colors . ".vim"<CR>

" move through the error list
nmap <A-,> :cprev<CR>
nmap <A-.> :cnext<CR>

" for finding tags
nmap <C-LeftMouse> <LeftMouse><A-\>
nmap <A-[> <C-T>
nmap <A-]> <C-]>
nmap <A-\> 12<C-W>]

" for moving through tag matches
nmap <A-}> :tnext<CR>
nmap <A-{> :tprev<CR>

" buffer navigation
nmap <C-Tab> :bnext<CR>
nmap <C-S-Tab> :bprev<CR>

" rebuild user help tags
nmap \<F1> :helptags $VIMFILES/doc<CR>

" rebuild tagfiles in current directory
nmap \t :call CTagsBuildTagfile()<CR>
nmap \T :call IDUtilsBuildDB()<CR>

" display syntax for current cursor
nmap \s \hlt

" searching & such
nmap <A-LeftMouse> <LeftMouse>:call IDUtilsLookup("<cword>")<CR>
nmap <A-=> :call IDUtilsLookup("<cword>")<CR>
nmap <A-+> :call IDUtilsLookup(input("-- "))<CR>
nmap <C-A-LeftMouse> <LeftMouse>:call BackgroundGrep("-R -w '<cword>' *")<CR>
nmap <A-/> :call BackgroundGrep("-R -w '<cword>' *")<CR>
nmap <A-?> :call BackgroundGrep("-R -w '" . input("-- ") . "' *")<CR>
nmap <A-;> :call BackgroundCodeGrep("-R -w '<cword>' *")<CR>
nmap <A-:> :call BackgroundCodeGrep("-R -w '" . input("-- ") . "' *")<CR>
nmap <A-'> :call LoadBackgroundGrepResults()<CR>
nmap <A-"> :call LoadBackgroundMakeResults()<CR>

" create a mapping for case-insensitive searching
nmap \/ /\c

" allows search highlight to be toggled
nmap <silent> \n :set hlsearch!<CR>

" nice mappings
nmap \<Tab> :retab<CR>
nmap <C-F1> :help <cword><CR>
"cmap wn :write<CR>:next<CR>

" familiar control keys
nmap <C-A> ggVG$
nmap <C-V> P
vmap <C-C> y
vmap <C-X> d

" enter new lines from normal mode
nmap <S-Enter> O<ESC>j
nmap <C-Enter> o<ESC>k 

" command line editing
map <C-K> :<Up>
cnoremap <C-O> <Home>
cnoremap <C-G> <C-E>
cnoremap <C-D> <C-W>
cnoremap <C-W> <S-Right>
cnoremap <C-B> <S-Left>
cnoremap <C-H> <Left>
cnoremap <C-L> <Right>
cnoremap <C-J> <Down>
cnoremap <C-K> <Up>

" some nice buffer windows
nmap <silent> `` q:
nmap <silent> \; :WMToggle<CR>
nmap <silent> \\ :call BufferList()<CR>
nmap <silent> \` :call QFixToggle()<CR>
nmap <silent> \~ :VSBufExplore<CR>
