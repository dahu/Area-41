" ============================================================================
" File:        pluginname - short description
" Description: long description
" Author:      Name <email>
" Last Change: date
" Website:     https://github.com/user/pluginname
"
" See pluginname.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help pluginname
"
" Licensed under the same terms as Vim itself.
" ============================================================================
let s:Pluginname_version = '0.1'

" Vimscript setup {{{1
" Allow use of line continuation.
let s:old_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development
"if exists("g:loaded_pluginname")
"      "\ || v:version < 700
"      "\ || v:version == 703 && !has('patch338')
"      \ || &compatible
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_pluginname = 1

" Options {{{1
if !exists('g:somevar')
  let g:somevar = 0
endif

" Private Functions {{{1
function! s:MyScriptLocalFunction()
  echom "change MyScriptLocalFunction"
endfunction

" Public Interface {{{1
function! MyPublicFunction()
  echom "change MyPublicFunction"
endfunction

" Maps {{{1
nnoremap <plug>PublicPlugName1 :call <SID>MyScriptLocalFunction()<CR>
nnoremap <plug>PublicPlugName2 :call MyPublicFunction()<CR>

if ! hasmapto('<plug>PublicPlugName1')
  nmap <unique><silent> <leader>p1 <plug>PublicPlugName1
endif

if ! hasmapto('<plug>PublicPlugName2')
  nmap <unique><silent> <leader>p2 <plug>PublicPlugName2
endif

" Commands {{{1
command! -nargs=0 MyCommand1 call <sid>MyScriptLocalFunction()
command! -nargs=0 MyCommand2 call MyPublicFunction()

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:old_cpo

" vim: set sw=2 sts=2 et fdm=marker:
