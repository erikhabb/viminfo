" $Id: ombuild.vim 42 2008-12-16 20:00:27Z jheddings $

if !exists("g:omons")
  finish
endif

syntax region omText start=+<echo[^(/>)]*>+ms=e+1 end=+</echo>+me=s-1
syntax region omText start=+<fail[^(/>)]*>+ms=e+1 end=+</fail>+me=s-1
syntax region omScript start=+<shell[^>]*>+ms=e+1 end=+</shell>+me=s-1

syntax region omLink start=+[a-z]\+://+ end=+[^a-zA-Z0-9%/_-]+me=s-1

syn cluster xmlTagHook add=omElement

syntax keyword omElement add-package rpmbuild configure dependency depends install shell
syntax keyword omElement svninfo kernelrelease realclean assembly omftp precache

" link to standard types
hi def link omText String
hi def link omElement Statement
hi def link omScript Special
hi def link omLink Underlined
