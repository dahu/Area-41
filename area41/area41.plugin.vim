" Vim global plugin for short description
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" License:	Vim License (see :help license)
" Location:	plugin/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%

" Vimscript Setup: {{{1
" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development.
" XXX The conditions are only as examples of how to use them. Change them as
" needed. XXX
"if exists("g:loaded_%FILE%")
"      \ || v:version < 700
"      \ || v:version == 703 && !has('patch338')
"      \ || &compatible
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_%FILE% = 1

" Options: {{{1
if !exists('g:%FILE%_some_plugin_option')
  let g:%FILE%_some_plugin_option = 0
endif

" Private Functions: {{{1
function! s:MyScriptLocalFunction()
  echom "change MyScriptLocalFunction"
endfunction

" Public Interface: {{{1
function! MyPublicFunction()
  echom "change MyPublicFunction"
endfunction

" Maps: {{{1
nnoremap <Plug>%FILE%1 :call <SID>MyScriptLocalFunction()<CR>
nnoremap <Plug>%FILE%2 :call MyPublicFunction()<CR>

if !hasmapto('<Plug>%FILE%1')
  nmap <unique><silent> <Leader>p1 <Plug>%FILE%1
endif

if !hasmapto('<Plug>%FILE%2')
  nmap <unique><silent> <Leader>p2 <Plug>%FILE%2
endif

" Commands: {{{1
command! -nargs=0 -bar MyCommand1 call <SID>MyScriptLocalFunction()
command! -nargs=0 -bar MyCommand2 call MyPublicFunction()

" Teardown: {{{1
" reset &cpo back to users setting
let &cpo = s:save_cpo

" Template From: https://github.com/dahu/Area-41/
" vim: set sw=2 sts=2 et fdm=marker:
