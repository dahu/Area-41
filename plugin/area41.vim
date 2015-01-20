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

let s:area41_version = '0.1'

" Vimscript Setup: {{{1
" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

" load guard
" uncomment after plugin development
"if exists("g:loaded_area41")
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

if v:version < 703
      \ || v:version == 703 && !has('patch465')
  " Use the old two-arguments glob()
  function! s:glob2list(expr)
    return split(glob(a:expr, 1), "\n")
  endfunction
else
  " Use the new three-arguments glob()
  function! s:glob2list(expr)
    return glob(a:expr, 1, 1)
  endfunction
endif

" Check if the given template is available.
function! s:is_available(template)
  return len(filter(s:get_available(), 'v:val ==# a:template')) > 0
endfunction

" Get user dir's path if any.
function! s:get_user_crypt()
  return glob('$HOME/.vim/area41')
endfunction

" Get list of available templates.
function! s:get_available()
  let user_crypt = s:get_user_crypt()
  let templates = map(s:glob2list(s:crypt . '/*'),
        \ 'fnamemodify(v:val, ":t:r:e")')
  if !empty(user_crypt)
    let templates += map(s:glob2list(user_crypt . '/*'),
          \ 'fnamemodify(v:val, ":t:r:e")')
  endif
  return filter(templates, 'count(templates, v:val) == 1')
endfunction

" Return a valid extension depending on the template.
function! s:get_extension(template)
  if index(['doc', 'help', 'documentation'], a:template) > -1
    return '.txt'
  else
    return '.vim'
  endif
endfunction

" Args:
" - bang: Forces editing an existing file/buffer.
" - kind: Kind of plugin to load.
" - a:1 : If provided the template will be loaded there. Otherwise load the
"   template on the current buffer.
function! s:handle_args(bang, kind, ...)
  if !exists(':Template')
    echoe 'Area41: The Template plugin is not installed.'
    return 0
  endif
  if !s:is_available(a:kind)
    " TODO: An error would be nice here.
    echoe 'Area41: No such template.'
    return 0
  endif
  let remove_empty = 0
  if a:0 && !empty(a:1)
    let file = a:1 . (a:1 =~ '\.\S\+$' ? '' : s:get_extension(a:kind))
    if !a:bang
          \ && ( !empty(glob(file))
          \ || !empty(filter(range(1, bufnr('$')),
          \       'bufname(v:val) =~ file.''$''')))
      " TODO: Error here.
      echoe 'Area41: File exists, add "!" to override.'
      return 0
    endif
    exec 'edit ' . file
    let remove_empty = 1
    if !expand('%') == file
      echoe 'Area41: The template could not be loaded.'
      return 0
    endif
  endif
  return s:load_template(a:kind, remove_empty)
endfunction

function! s:globals()
  return {
        \ 'stack': [],
        \ 'replace': function('s:replace_global'),
        \ 'restore': function('s:restore_globals')}
endfunction

function! s:replace_global(name, new_value) dict
  call add(self.stack, {
        \ 'name': a:name,
        \ 'existed': has_key(g:, a:name),
        \ 'orig_value': get(g:, a:name, 0)})
  let g:[a:name] = a:new_value
endfunction

function! s:restore_globals() dict
  for global in self.stack
    if global.existed
      let g:[global.name] = global.orig_value
    else
      unlet g:[global.name]
    endif
  endfor
  let self.stack = []
endfunction

" Read the given template into the current buffer.
function! s:load_template(template, remove_empty)
  let linescount = line('$')
  let globals = s:globals()
  call globals.replace('templates_directory', [s:crypt, s:get_user_crypt()])
  call globals.replace('templates_global_name_prefix', 'area41.')
  exec 'Template ' . a:template . s:get_extension(a:template)
  if a:remove_empty && empty(getline('$'))
    let save_fold = &foldenable
    setl nofoldenable
    $d_
    silent! normal! ``
    let &foldenable = save_fold
  endif
  call globals.restore()
  return line('$') > linescount
endfunction

function! s:command_complete(ArgLead, CmdLine, CursorPos)
  if a:CmdLine[: a:CursorPos ] =~# '\m\(^\s*\||\s*\)\S\+\s\+\S*$'
    " Completion for templates.
    let list = filter(s:get_available(), 'v:val =~# a:ArgLead')
  elseif a:CmdLine[: a:CursorPos ] =~?
        \'\m\%(^\s*\||\s*\)\S\+\s\+\S*\%(\s\+\S\+\)*\s\+\S*$'
    " Completion for files/dirs.
    let list = s:glob2list(a:ArgLead.'*')
  endif
  " Add trailing slash to directories.
  call map(list, 'isdirectory(v:val) ? v:val."/" : v:val')
  " Return non-empty items.
  return filter(list, 'v:val !~ ''^\s*$''')
endfunction

" Commands: {{{1
command! -nargs=+ -bar -bang -complete=customlist,<SID>command_complete
      \ Area41 call s:handle_args(<bang>0, <f-args>)

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:
