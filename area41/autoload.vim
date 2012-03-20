""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim library for short description
" Maintainer:	Name <email>
" Version:	0.1
" Description:	Long description.
" Last Change:	date
" License:	Vim License (see :help license)
" Location:	autoload/pluginname.vim
" Website:	https://github.com/user/pluginname
"
" See pluginname.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help pluginname
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:Pluginname_version = '0.1'

" Vimscript Setup: {{{1
" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development
"if exists("g:loaded_pluginlibname")
"      \ || v:version < 700
"      \ || v:version == 703 && !has('patch338')
"      \ || &compatible
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_pluginlibname = 1

" Private Functions: {{{1
function! s:MyScriptLocalFunction()
  echom "change MyScriptLocalFunction"
endfunction

" Library Interface: {{{1
function! pluginname#greetings()
  echo "Hello world!"
endfunction

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:
