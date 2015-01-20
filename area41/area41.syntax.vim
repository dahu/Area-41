" Vim syntax plugin.
" Language:	%FILE%
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" License:	Vim License (see :help license)
" Location:	syntax/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help. This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

syn keyword	%FILE%Todo	TODO FIXME XXX

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link %FILE%Todo	Todo

let b:current_syntax = "%FILE%"

let &cpo = s:save_cpo
unlet s:save_cpo

" Template From: https://github.com/dahu/Area-41/
" vim: set sw=2 sts=2 et fdm=marker:
