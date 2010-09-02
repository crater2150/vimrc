" Vim Compiler File javac.vim
" Compiler: Sun/IBM JDK: Javac

if exists("current_compiler")
  finish
endif
let current_compiler = "javac"

" Javac defaults to printing output on stderr and no options can convert,
" so we have to set 'shellpipe'
setlocal shellpipe=2>
" 2> works on Win NT and UNIX
setlocal makeprg=javac\ #<.java
setlocal errorformat=%f:%l:%m
" I'm not familiar with 'errorformat', so I set it very simple.

