"{{{ - GotoTabByName(...)
function! GotoTabByName(...)
    if a:0 == 0
        if exists("g:lasttab")
            let l:gototab = g:lasttab
            let g:lasttab = tabpagenr()
            exec "tabnext" l:gototab
        endif
        return
    endif
    let g:lasttab = tabpagenr()
    for tabnumber in range(1, tabpagenr('$'))
        for buffnr in tabpagebuflist(tabnumber)
            if match(bufname(buffnr), a:1) != -1
                exec "tabnext" tabnumber
                return
            endif
        endfor
    endfor
endfunction
command! -complete=buffer -nargs=1 Go call GotoTabByName(<q-args>)

nmap gn :Go<Space>
"}}}

