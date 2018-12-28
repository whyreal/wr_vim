
function! wr#Sum(col, fl, ll)
    exec  "pythonx wr.sum(int(" . a:col . "), int(" . a:fl . ") - 1, int(" . a:ll . "))"
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

function! wr#GoInstallDeps()
    !go install -i
endfun

" https://ddrscott.github.io/blog/2016/vim-toggle-movement/
function! wr#ToggleHomeZero()
  let pos = getpos('.')
  execute "normal! ^"
  if pos == getpos('.')
    execute "normal! 0"
  endif
endfunction

" vim: sw=4
