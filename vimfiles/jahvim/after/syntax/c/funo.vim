" $Id: funo.vim 44 2008-12-23 05:04:23Z jheddings $

if !exists("g:funo")
  finish
endif

syntax keyword funoType BOOL INT1 INT8 INT16 INT32 INT64 UINT8 UINT16 UINT32 UINT64
syntax keyword funoType timespec_t score_t version_t
syntax keyword funoMacro FOREVER
syntax keyword funoConstant TRUE FALSE

syn region funoPreProc start="^\s*\(%:\|#\)\s*\(fuses\|int\|use\|device\)" skip="\\$" end="$" keepend

" link to standard types
hi def link funoType Type
hi def link funoMacro Macro
hi def link funoPreProc PreProc
"hi def link funoFunction Function
"hi def link funoVariable Constant
hi def link funoConstant Constant
"hi def link funoStatement Statement
