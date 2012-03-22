""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim global plugin provides templates for Vim plugins.
" Maintainers:	Israel Chauca F <israelchauca@gmail.com>
"		Barry Arthur
" Version:	0.1
" Description:	Provides templates for the different types of plugins that Vim
" 		uses, such as global, filetype, syntax, colors, etc. Also, a
" 		command :Area41 is available to load the templates.
" 		It uses the Templates(1) plugin as the template engine.
" Last Change:	2012-03-21
" License:	Vim License (see :help license)
" Location:	plugin/area41.vim
" Website:	https://github.com/dahu/Area-41
"
" See area41.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help area41
"
" (1) https://github.com/aperezdc/vim-template
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:area41_version = '0.1'

" Vimscript Setup: {{{1
" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development
"if exists("g:loaded_area41")
"      \ || v:version < 700
"      \ || v:version == 703 && !has('patch338')
"      \ || &compatible
"  let &cpo = s:save_cpo
"  finish
"endif
"let g:loaded_area41 = 1

" Options: {{{1
if !exists('g:somevar')
  let g:somevar = 0
endif

let s:crypt = expand('<sfile>:p:h:h') . '/area41'

" Private Functions: {{{1
function! s:is_available(template)
  let [crypt, user_crypt] = s:get_crypts()
  let templates = map(glob(crypt . '/*', 0, 1), 'fnamemodify(v:val, ":t:r:e")')
  if !empty(user_crypt)
    let templates += map(glob(user_crypt . '/*', 0, 1), 'fnamemodify(v:val, ":t:r:e")')
  endif
  return len(filter(templates, 'v:val ==# a:template')) > 0
endfunction

function! s:get_crypts()
  return [
        \ s:crypt,
        \ glob('$HOME/.vim/area41')
        \]
endfunction

function! s:handle_args(bang, kind, ...)
  if !s:is_available(a:kind)
    " TODO: An error would be nice here.
    echoe 'No such template!'
    return 0
  endif
  if a:0 && !empty(a:1)
    let file = a:1 . (a:1 =~ '\.vim$' ? '' : '.vim')
    if a:bang || !empty(glob(file))
      " TODO: Error here.
      echoe 'File exists!'
      return 0
    endif
    exec 'edit ' . file
  endif
  call s:load_template(a:kind)
endfunction

function! s:load_template(template)
  let linescount = line('$')
  let done = 0
  let existed = exists('g:template_dir')
  let template_dir = existed ? g:template_dir : ''
  for dir in s:get_crypts()
    let g:template_dir = dir
    exec 'Template ' . a:template . '.vim'
    if linescount < line('$')
      let done = 1
      break
    endif
  endfor
  if existed
    let g:template_dir = template_dir
  else
    unlet g:template_dir
  endif
  return done
endfunction

" Commands: {{{1
command! -nargs=+ -bar -bang Area41 call s:handle_args(<bang>0, <f-args>)

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:
