" Vim indent plugin.
" Language:	%FILE%
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" License:	Vim License (see :help license)
" Location:	indent/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

setlocal indentexpr=Get%FILE%Indent()
setlocal indentkeys+=

" Restore when changing filetype.
let b:undo_indent = "setl indentexpr< indentkeys<"

" Only define the function once.
if exists("s:loaded")
  let &cpo = s:save_cpo
  unlet s:save_cpo
  finish
endif
let s:loaded = 1

function Get%FILE%Indent()
  " Do magic here.
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" Template From: https://github.com/dahu/Area-41/
" vim: set sw=2 sts=2 et fdm=marker:
