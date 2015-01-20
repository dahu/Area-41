" Vim filetype detect plugin.
" Language:	%FILE%
" Maintainer:	%USER% <%MAIL%>
" Version:	0.1
" Description:	Long description.
" License:	Vim License (see :help license)
" Location:	ftdetect/%FFILE%
" Website:	https://github.com/%HERE%/%FILE%
"
" See %FILE%.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help %FILE%

au BufRead,BufNewFile *.%FILE%	set filetype=%FILE%

" Template From: https://github.com/dahu/Area-41/
