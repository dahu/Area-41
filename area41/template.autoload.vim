""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim library for short description
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" Last Change:	%DATE%
" License:	Vim License (see :help license)
" Location:	autoload/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:%FILE%_version = '0.1'

" Vimscript Setup: {{{1
" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development
" Remove the conditions you do not need, they are there just as an example.
"if exists("g:loaded_lib_%FILE%")
"      \ || v:version < 700
"      \ || v:version == 703 && !has('patch338')
"      \ || &compatible
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_lib_%FILE% = 1

" Private Functions: {{{1
function! s:MyScriptLocalFunction()
  echom "change MyScriptLocalFunction"
endfunction

" Library Interface: {{{1
function! %FILE%#greetings()
  echo "Hello world!"
endfunction

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:
