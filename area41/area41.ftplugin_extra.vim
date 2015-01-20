" Vim filetype plugin.
" Language:	%FILE%
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" License:	Vim License (see :help license)
" Location:	ftplugin/%FFILE%
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

" Load only when it can perform its magic.
if v:version < 700 || &compatible
  let &cpo = s:save_cpo
  finish
endif

" Local Mappings: {{{1
if !hasmapto('<Plug>%FILE%')
  nmap <unique><silent><buffer> <Leader>v <Plug>%FILE%
endif

" Local Commands: {{{1
command! -buffer -nargs=0 -bar MyCommand1 call <sid>MyScriptLocalFunction()

" Undo Settings: {{{1
" XXX This is a monster.
let s:undo_ftplugin = 'sil! unmap <buffer> <Leader>v'
if exists('b:undo_ftplugin') && b:undo_ftplugin !~ '<Plug>%Plugin%'
  if b:undo_ftplugin =~ '^\s*$'
    let b:undo_ftplugin = s:undo_ftplugin
  else
    let b:undo_ftplugin = s:undo_ftplugin.'|'.b:undo_ftplugin
  endif
elseif !exists('b:undo_ftplugin')
  let b:undo_ftplugin = s:undo_ftplugin
endif

" Script Resources: {{{1
if exists('s:loaded_pluginname')
  let &cpo = s:save_cpo
  finish
endif
let s:loaded_pluginname = 1

" Private Functions:
function! s:MyScriptLocalFunction()
  echom "change MyScriptLocalFunction"
endfunction

" Public Interface:
function! %FILE%MyPublicFunction()
  echom "change MyPublicFunction"
endfunction

" Mappings:
nnoremap <Plug>%FILE% :call <SID>MyScriptLocalFunction()<CR>

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo
unlet s:save_cpo

" Template From: https://github.com/dahu/Area-41/
" vim: set sw=2 sts=2 et fdm=marker:
