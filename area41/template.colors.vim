""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim color scheme
" Maintainer:	Name <email>
" Version:	0.1
" Description:	Long description.
" Last Change:	date
" License:	Vim License (see :help license)
" Location:	color/pluginname.vim
" Website:	https://github.com/user/pluginname
"
" See pluginname.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help pluginname
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:Pluginname_version = '0.1'

" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "pluginname"

hi Normal ctermbg=DarkGrey ctermfg=White guifg=White guibg=grey20

" vim: set sw=2 sts=2 et fdm=marker:
