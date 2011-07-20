" [mimoc.vim] ftplugin for mimoc message editing
"
" Author: Alexander Gehrke <me@crater2150.de>

" Only do this when not yet done for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

set buftype=nofile
set noswf

nnoremap <cr> :exe "w !".b:sendcmd<cr><cr>ggdG
autocmd VimLeave * exe "!".b:quitcmd
