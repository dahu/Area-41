""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim color scheme
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" Last Change:	%DATE%
" License:	Vim License (see :help license)
" Location:	color/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:%FILE%_version = '0.1'

" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "%FILE%"

hi Normal ctermbg=DarkGrey ctermfg=White guifg=White guibg=grey20

" vim: set sw=2 sts=2 et fdm=marker:
