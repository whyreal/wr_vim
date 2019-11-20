" Command {{{1
" update pac file
command! Ssconfig tabe ~/.ShadowsocksX/user-rule.txt
au BufWritePost ~/.ShadowsocksX/user-rule.txt
            \ !genpac --format=pac
            \ --pac-proxy="SOCKS5 127.0.0.1:1080; SOCKS 127.0.0.1:1080; DIRECT;"
            \ --user-rule-from=~/.ShadowsocksX/user-rule.txt
            \ > ~/.ShadowsocksX/gfwlist.js

" generate ssh config
command! Sshconfig tabe ~/Documents/Note/scripts/ssh.config.json
au BufWritePost ~/Documents/Note/scripts/ssh.config.json
            \ !cd ~/Documents/Note/scripts/
            \ && ./jinja2.generater ssh.config.j2 ssh.config.json
            \ > ~/.ssh/config

" vimrc
command! VimrcEdit tabe ~/.vim/vimrc
command! VimrcReload so ~/.vim/vimrc

" dos
command! Dos2unix e ++ff=unix | %s/

" note
command! Favorites cd ~/Documents/vim-workspace/常用文档 | Explore .
command! Docs cd ~/Documents/vim-workspace/docs | Explore .
command! Worklog edit ~/Documents/Note/work.shortcut.md

" json
command! JSONFormat %!python -m json.tool

" dict
"nnoremap <silent> ? :!open dict://<cword><CR><CR>

" pandoc
command! Md2pdf !md2pdf %
command! Md2doc !md2doc %

" Server
fun! Server_update_info()
    if !exists("t:remote_host")
        echoerr "t:remote_host is undefined"
        return
    endif
    if type(t:remote_host) != 1 || t:remote_host == ""
        echoerr "t:remote_host should be string and not empty"
        return
    endif

    set ft=sh fdm=marker buftype=nofile
    normal ggdG
    call append(0, systemlist("cat ~/.vim/scripts/server_info.sh | ssh -T " . t:remote_host))
    call histadd(":", "r! ssh " . t:remote_host . " cmd")
    call histadd(":", "ServerUpdateInfo")
    go 1
endfun
command! ServerUpdateInfo :call Server_update_info()

fun Edit(path)
    set buftype=nofile
    if !exists("t:remote_host")
        execut "e " . a:path
    elseif type(t:remote_host) != 1 || t:remote_host == ""
        echoerr "t:remote_host should be string and not empty"
        return
    else
        execut "e scp://" . t:remote_host . "/" . a:path
    endif
    call histadd(":", "Edit " . a:path)
endfun
command! -nargs=1 Edit :call Edit(<f-args>)
"}}}
" vim: fdm=marker ts=4 sw=4
