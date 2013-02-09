" Vim filetype detect plugin for filetype name.
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" Last Change:	%DATE%
" License:	Vim License (see :help license)
" Location:	ftdetect/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%

let g:%FILE%_version = '0.1'

au BufRead,BufNewFile *.%FILE%	set filetype=%FILE%
