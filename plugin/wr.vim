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
command! Dos2unix e ++ff=unix | %s///g

" note
command! Note tab new | lcd ~/Documents/Note/ | NERDTree | set titlestring=Note

" json
command! JSONFormat %!python -m json.tool

" dict
nnoremap <silent> ? :!open dict://<cword><CR><CR>

" iterm2
command! Term !open -a /Applications/Utilities/Terminal.app %:h

"}}}
" vim: fdm=marker ts=4 sw=4
