exec g:wr_uspy "import wr"
exec g:wr_uspy "tg = wr.TextGenerator()"

function! wr#Format(fl, ll)
    exec g:wr_uspy "tg.format(int(" . a:fl . ") - 1, int(" . a:ll . "))"
endfunction

function! wr#SetTemplate(fl, ll)
    exec g:wr_uspy "tg.set_template(int(" . a:fl . ") - 1, int(" . a:ll . "))"
endfunction

function! wr#UnSetTemplate()
    exec g:wr_uspy "tg.unset_template()"
endfunction

function! wr#Sum(col, fl, ll)
    exec g:wr_uspy "wr.sum(int(" . a:col . "), int(" . a:fl . ") - 1, int(" . a:ll . "))"
endfunction

function! wr#test()
    exec g:wr_uspy "wr.test()"
endfunction

function! wr#Delete_blank()
    %s/[ \t]*$//ge 
    "exe "normal \<c-o>"
    :w
endfunction

" Find file in current directory and edit it.
function! wr#FindFile(name)
    let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
    " replace above line with below one for gvim on windows
    " let l:list=system("find . -name ".a:name." | perl -ne \"print qq{$.\\t$_}\"")
    let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
    if l:num < 1
	echo "'".a:name."' not found"
	return
    endif
    if l:num != 1
	echo l:list
	let l:input=input("Which ? (CR=nothing)\n")
	if strlen(l:input)==0
	    return
	endif
	if strlen(substitute(l:input, "[0-9]", "", "g"))>0
	    echo "Not a number"
	    return
	endif
	if l:input<1 || l:input>l:num
	    echo "Out of range"
	    return
	endif
	let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
    else
	let l:line=l:list
    endif
    let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
    execute ":e ".l:line
endfunction

function! wr#DetectVoomType()
if &fdm == 'marker'
	let g:voom_ft_modes[&ft] = 'fmr'
endif
endfunction

" vim: sw=4
