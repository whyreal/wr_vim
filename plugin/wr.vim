if has('python')
	let g:wr_uspy = ":py"
elseif has('python3')
	let g:wr_uspy = ":py3"
endif

command! -range SetTpl call wr#SetTemplate(<line1>, <line2>)
command! UnSetTpl call wr#UnSetTemplate()
command! -range Format call wr#Format(<line1>, <line2>)

command! -range Sum call wr#Sum(<args>, <line1>, <line2>)
command! -nargs=1 FindFile call wr#FindFile("<args>")

nnoremap <silent> ? :!open dict://<cword><CR><CR>
command! MakeTags !cd %:p:h && ctags -R .
command! Dos2unix %s///g
command! DeleteBlank call wr#Delete_blank()

command! -nargs=+ Range call append(line('.'), range(<f-args>))

" char pair"{{{
"inoremap " <c-r>=QuoteDelim('"')<CR>
"inoremap ' <c-r>=QuoteDelim("'")<CR>
"inoremap ( ()<Esc>i
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap < <lt>><Esc>i
"inoremap > <c-r>=ClosePair('>')<CR>
"inoremap [ []<Esc>i
"inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap { {}<Esc>i
"inoremap } <c-r>=ClosePair('}')<CR>

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
