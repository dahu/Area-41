""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim indent plugin for filetype name.
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" Last Change:	%DATE%
" License:	Vim License (see :help license)
" Location:	indent/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:%FILE%_version = '0.1'

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
   finish
endif
let b:did_indent = 1

" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

setlocal indentexpr=GetFileTypeNameIndent()
setlocal indentkeys+=

" Only define the function once.
if exists("s:loaded")
  finish
endif
let s:loaded = 1

function GetFileTypeNameIndent()
  " Do magic here.
endfunction

" Restore when changing filetype.
let b:undo_indent = "setl indentexpr< indentkeys<"

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:
