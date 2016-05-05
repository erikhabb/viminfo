" for text files
if exists("b:jah_ftplugin")
  finish
endif
let b:jah_ftplugin = 1

setlocal noexpandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal wrap
setlocal linebreak
setlocal nosmartindent

setlocal formatoptions=w1tn
setlocal textwidth=78
