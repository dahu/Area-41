""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim compiler plugin for compiler name.
" Maintainer:	Name <email>
" Version:	0.1
" Compiler:	Long description.
" Last Change:	date
" License:	Vim License (see :help license)
" Location:	compiler/compilername.vim
" Website:	https://github.com/user/pluginname
"
" See pluginname.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help pluginname
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("current_compiler")
  finish
endif
let current_compiler = "compilername"

" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

" Older Vim don't define :CompilerSet
if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

" Set the errorformat as required.
CompilerSet errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

CompilerSet makeprg=compilercmd

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:
