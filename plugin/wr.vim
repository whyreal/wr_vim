py <<EOF
import vim
EOF

command! -range Sum call wr#Sum(<args>, <line1>, <line2>)

command! -range Format call wr#Format(<line1>, <line2>)
command! -range SetTpl call wr#SetTemplate(<line1>, <line2>)
command! UnSetTpl call wr#UnSetTemplate()

command! -nargs=1 FindFile :call wr#FindFile("<args>")

nnoremap <silent> ? :!open dict://<cword><CR><CR>

command! MakeTags !cd %:p:h && ctags -R .
command! Dos2unix %s///g
command! DeleteBlank call wr#Delete_blank()

command! -nargs=+ Range call append(line('.'), range(<f-args>))

" char pair"{{{
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
inoremap ( ()<Esc>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap < <lt>><Esc>i
inoremap > <c-r>=ClosePair('>')<CR>
inoremap [ []<Esc>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap { {}<Esc>i
inoremap } <c-r>=ClosePair('}')<CR>

function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		"Inserting a quoted quotation mark into the string
		return a:char
	elseif line[col - 1] == a:char
		"Escaping out of the string
		return "\<Right>"
	else
		"Starting a string
		return a:char.a:char."\<Esc>i"
	endif
endf

function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf"}}}

" vim: fdm=marker ts=4 sw=4
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
