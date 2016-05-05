" erik color scheme
" this is for GVIM only

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="erikColors2"

" Normal text
hi Normal guifg=#D9D9D9 guibg=#000000

" Tweak the line number column
hi LineNr guifg=#FFFF00 guibg=#4D4D4D

" Messages
hi WarningMsg guifg=#FF0000
hi ErrorMsg guibg=#FF0000 guifg=White

" Folding
hi Folded guibg=LightGrey guifg=DarkBlue
hi FoldColumn guibg=Grey guifg=DarkBlue

" Diff
hi DiffAdd guibg=DarkBlue
hi DiffChange guibg=DarkMagenta
hi DiffDelete gui=bold guifg=Blue guibg=DarkCyan
hi DiffText gui=bold guibg=#FF0000

" Groups for programming
hi Constant guifg=#D98888 guibg=#000000
hi String guifg=#A0A0FF guibg=#000000
hi Character guifg=#A0A0FF guibg=#000000
hi Comment guifg=#67A366
hi PreProc guifg=#87CEEB
hi Statement guifg=#C1BF00 gui=NONE
hi Todo guifg=#FFFF00 guibg=#A0A0FF
hi Identifier guifg=#00A7A7 gui=NONE
hi Type guifg=#00A7A7 gui=NONE
hi Error guibg=#FF0000
hi Special guifg=#D18A00 guibg=#000000
hi Underline guifg=#80A0FF gui=underline

" File browser
hi Directory guifg=#40FFFF

" Search highlight
hi Search guibg=#FFFF00 guifg=Black
hi IncSearch gui=reverse

" Visual mode
hi Visual gui=reverse guifg=Grey guibg=fg
hi VisualNOS gui=underline,bold

" Set up the look of the cursor
hi Cursor guibg=Green guifg=Black
hi lCursor guibg=#40FFFF guifg=Black

" Status line messages
hi StatusLine gui=reverse,bold
hi StatusLineNC gui=reverse

" Other messages
hi ModeMsg gui=bold
hi MoreMsg gui=bold guifg=SeaGreen

" Groups used in the 'highlight' and 'guicursor' options default value.
hi VertSplit gui=reverse
hi NonText gui=bold guifg=LightBlue guibg=grey30
hi Question gui=bold guifg=Green
hi SpecialKey guifg=#40FFFF
hi Title gui=bold guifg=Magenta
hi WildMenu guibg=#FFFF00 guifg=Black
hi Ignore guifg=grey20


"hi Brackets guifg=Yellow
