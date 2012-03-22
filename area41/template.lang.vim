""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim menu translation plugin for language name.
" Maintainer:	Name <email>
" Version:	0.1
" Description:	Long description.
" Last Change:	date
" License:	Vim License (see :help license)
" Location:	lang/langname.vim
" Website:	https://github.com/user/pluginname
"
" See pluginname.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help pluginname
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:Pluginname_version = '0.1'

" Quit when menu translations have already been done.
if exists("did_menu_trans")
  finish
endif
let did_menu_trans = 1

" Help menu
menutrans &Help			&HelpTranslation
