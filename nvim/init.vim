"
" taken from:
" https://github.com/nvie/vimrc/blob/main/nvim/init.vim
" Installation
"   Symlink ~/.config/nvim to this project.
"
"   $ mkdir -p ~.config
"   $ cd ~/.config
"   $ ln -s ~/Projects/vimrc/nvim
"   $ nvim ~/.config/nvim/init.vim
"   And run: :PlugInstall.
"
"

" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"  install vim-plug automatically
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Editing behaviour {{{
set copyindent                  " copy the previous indentation on autoindenting
set expandtab                   " expand tabs by default (overloadable per file type later)
set ignorecase                  " ignore case when searching
set nohlsearch                  " turn off search highlighting
set noincsearch                 " turn off incremental search
set nowrap                      " don't wrap lines
set number                      " always show line numbers
set scrolloff=2                 " keep 2 lines off the edges of the screen when scrolling
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=4                " number of spaces to use for autoindenting
set showmatch                   " set show matching parenthesis
set showmode                    " always show what mode we're currently editing in
set showtabline=1               " show tab page labels only if there are at least two tab pages
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smartindent                 " do smart autoindenting when starting a new line
set smarttab                    " use shiftwidth for tab in front of a line
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=4                   " a tab is four spaces
set updatetime=1000             " Speed up the updatetime so gitgutter and friends are quicker

" Make the keyboard faaaaaaast
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50
" }}}

" Vim behaviour {{{
syntax on
hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=white guibg=Grey40 guifg=white
set backspace=indent,eol,start  " backspace over autoindent, line breaks, start of insert
set cursorline nocursorcolumn
set nobackup                    " do not keep backup files, it's 70's style cluttering
set noerrorbells                " don't beep
set nomodeline                  " disable mode lines (security measure)
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set nowritebackup               " do not write out changes via backup files
set ruler                       " show line and column number of cursor position
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
set visualbell                  " don't beep
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match

" delete trailing whitespace on file write/close, maybe override this later
" with format on save as nvie/*/init.vim does
autocmd BufWritePre * exe "mark s | g/$/s/  *$// | 's"

" command to override existing formatting and set up linux kernel source code
" formatting
:command Kernel set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
" }}}

" Plugins ---------------------------------------------------------------- {{{

call plug#begin('~/.config/nvim/plugged')

Plug 'roblillack/vim-bufferlist'
Plug 'scrooloose/nerdtree'

call plug#end()

" }}}

" BufferList settings {{{
nmap <silent> \\ :call BufferList()<CR>
" }}}

" NERDTree settings {{{
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.config/nvim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open
" files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]

" }}}
