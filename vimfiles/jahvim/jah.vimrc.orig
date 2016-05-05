" $Id: jah.vimrc 34 2008-08-12 21:52:56Z jheddings $
let $VIMFILES=expand("<sfile>:p:h")

" basic stuff
set nocompatible
set viminfo='50,n$VIMFILES/viminfo

" window sizing stuff
if has("gui_running")
  set lines=60
  set columns=100
endif
" **  This line is 80 chars long  **********************************************

" general settings
set showcmd
set nobackup
set ruler
set nowrap
set noerrorbells

set scrolloff=2
set history=100
set updatetime=500
set showtabline=1
set visualbell t_vb=
set backspace=indent,eol,start

filetype plugin indent on

" search options
set incsearch
set nohlsearch
set ignorecase
set smartcase

" useful programming features
set number
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set showmatch
set matchtime=4
set cscopequickfix=s-,c-,d-,i-,t-,e-

" GUI features
set mousehide
set guioptions=gmrLt
set winaltkeys=menu
set laststatus=1

" wildmenu settings
set wildmenu
set wildmode=full

" colors & font
syntax on
colors jah

" the default is "\" but I use that a lot, so...
let g:mapleader=","

" other configuration files
helptags $VIMFILES/doc

" configure QFixToggle
let g:QFixToggle_Height=12

" configure clibs
let c_hi_identifiers = 'all'
let c_hi_libs = ['*']

