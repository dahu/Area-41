" Vim keymap plugin for language name.
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" Last Change:	%DATE%
" License:	Vim License (see :help license)
" Location:	keymap/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%

let g:%FILE%_version = '0.1'

" Use this short name in the status line.
let b:keymap_name = "%FILE%"

loadkeymap
a	<char-0x###>	" Comment
