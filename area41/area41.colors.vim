" Vim color scheme
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" License:	Vim License (see :help license)
" Location:	color/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%

" First remove all existing highlighting.
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "%FILE%"

hi Normal ctermbg=DarkGrey ctermfg=White guifg=White guibg=grey20

" Template From: https://github.com/dahu/Area-41/
" vim: set sw=2 sts=2 et fdm=marker:
