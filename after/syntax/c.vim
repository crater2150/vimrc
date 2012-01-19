" Vim syntax file example
" Put it to ~/.vim/after/syntax/ and tailor to your needs.

if version < 600
  so <sfile>:p:h/libsdl.vim
else
  runtime! syntax/libsdl.vim
endif

" vim: set ft=vim :
