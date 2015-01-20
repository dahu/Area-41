" Vim menu translation plugin for %FILE%.
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" License:	Vim License (see :help license)
" Location:	lang/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help. This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%

" Quit when menu translations have already been done.
if exists("did_menu_trans")
  finish
endif
let did_menu_trans = 1

" Help menu
menutrans &Help			&HelpTranslation

" Template From: https://github.com/dahu/Area-41/
