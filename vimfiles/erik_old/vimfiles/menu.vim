" some handy menu stuff...

" editing of vim files
menu jah.Vim\ Files.ftplugin :execute "edit $VIMFILES/ftplugin/" . &filetype . "_jah.vim"<CR>
menu jah.Vim\ Files.colors \p
menu jah.Vim\ Files.mapping :edit $VIMFILES/mapping.vim<CR>
menu jah.Vim\ Files.tagging :edit $VIMFILES/tagging.vim<CR>
menu jah.Vim\ Files.utils :edit $VIMFILES/utils.vim<CR>
menu jah.Vim\ Files.vimrc \e
