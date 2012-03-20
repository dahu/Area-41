""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim global plugin for short description
" Maintainer:	Name <email>
" Version:	0.1
" Description:	Long description.
" Last Change:	date
" License:	Vim License (see :help license)
" Location:	plugin/pluginname.vim
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
"if exists("g:loaded_pluginname")
"      \ || v:version < 700
"      \ || v:version == 703 && !has('patch338')
"      \ || &compatible
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_pluginname = 1

" Options: {{{1
if !exists('g:somevar')
  let g:somevar = 0
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
nnoremap <Plug>PublicPlugName1 :call <SID>MyScriptLocalFunction()<CR>
nnoremap <Plug>PublicPlugName2 :call MyPublicFunction()<CR>

if !hasmapto('<Plug>PublicPlugName1')
  nmap <unique><silent> <leader>p1 <Plug>PublicPlugName1
endif

if !hasmapto('<Plug>PublicPlugName2')
  nmap <unique><silent> <leader>p2 <Plug>PublicPlugName2
endif

" Commands: {{{1
command! -nargs=0 -bar MyCommand1 call <SID>MyScriptLocalFunction()
command! -nargs=0 -bar MyCommand2 call MyPublicFunction()

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:
