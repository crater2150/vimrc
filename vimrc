set nocp

set directory=$XDG_CACHE_HOME/vim,~/,/tmp,.
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp,.
set runtimepath=$XDG_CONFIG_HOME/vim,$XDG_CONFIG_HOME/vim/after,$VIM,$VIMRUNTIME
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"
let $MYVIMDIR="$XDG_CONFIG_HOME/vim/"

filetype off
runtime packages

"if empty(matchstr(getcwd(), "/home/crater2150"))
set exrc
"endif

syntax on
filetype indent plugin on

" set t_Co=256
if &term =~ '^screen'
	" tmux will send xterm-style keys when its xterm-keys option is on
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif

set noerrorbells
set background=dark
colo pastel

set textwidth=80
if exists("&cc")
	set cc=+1
endif

set number

set tabstop=8
set shiftwidth=8
set smarttab

set whichwrap+=<,>,h,l

set notimeout
set ttimeout
set timeoutlen=50

set nf-=octal
set foldmethod=syntax

set vb t_vb=

set shellcmdflag=-c
set shell=/bin/zsh

set suffixes=.bak,~,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out,.o,.lo,\.class

set timeoutlen=500
set modeline
set showcmd

set scrolloff=99999
set cursorline

nnoremap <C-U> 11kzz
nnoremap <C-D> 11jzz
nnoremap j gjzz
nnoremap k gkzz
nnoremap # #zz
nnoremap * *zz
nnoremap n nzz
nnoremap N Nzz
nnoremap gg ggzz
nnoremap G Gzz
nnoremap gj jzz
nnoremap gk kzz
vnoremap < <gv
vnoremap > >gv

set hidden

if exists("&undofile")
	set undofile
	set undodir=~/.local/vim/undo/
endif

set spelllang=de

let mapleader = "\\"

set hls
set ignorecase smartcase
set completeopt=menu,longest,preview
set wildmode=list:longest,list:full
set wildignore+=*.so,*.swp,*.zip,*.o
set suffixes+=.pdf
set wildmenu

if exists("&cm")
	set cm=blowfish
endif

if &history < 1000
	set history=1000
endif

"{{{ latex

" controls filetype setting, therefore not possible to move to ftplugin
let g:tex_flavor = "latex"

"}}}

"{{{ Skeletons
augroup skeletons

	autocmd User plugin-skeleton-detect
				\ if expand('%') =~# 'gemspec$'
				\ | SkeletonLoad ruby-gemspec
				\ | endif


augroup END
"}}}


"{{{ status and tab line
set statusline=%0*\ %<%f%h%m%r\ \
			\%0*%=%b\ 0x%B\ \ %l,%c%V\ %P\ %y
set laststatus=2

if has('gui')
	set guioptions-=e
endif
if exists("+showtabline")
	function MyTabLine()
		let s = ''
		let t = tabpagenr()
		let i = 1
		while i <= tabpagenr('$')
			let buflist = tabpagebuflist(i)
			let winnr = tabpagewinnr(i)
			let s .= '%' . i . 'T'
			let s .= (i == t ? '%2*' : '%1*')
			let s .= ' '
			let s .= i . ':'
			let s .= winnr . '/' . tabpagewinnr(i,'$')

			let bufnrlist = tabpagebuflist(i)
			for bufnr in bufnrlist
				if getbufvar(bufnr, "&modified")
					let s .= '+'
					break
				endif
			endfor

			let s .= ' %*'
			let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
			let bufnr = buflist[winnr - 1]
			let file = bufname(bufnr)
			let buftype = getbufvar(bufnr, 'buftype')
			if buftype == 'nofile'
				if file =~ '\/.'
					let file = substitute(file, '.*\/\ze.', '', '')
				endif
			else
				let file = fnamemodify(file, ':p:t')
			endif
			if file == ''
				let file = '[No Name]'
			endif
			let s .= file
			let i = i + 1
		endwhile
		let s .= '%T%#TabLineFill#%='
		let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
		return s
	endfunction
	set stal=2
	set tabline=%!MyTabLine()
	map    <C-Tab>    :tabnext<CR>
	imap	 <C-Tab>    <C-O>:tabnext<CR>
	map    <C-S-Tab>  :tabprev<CR>
	imap   <C-S-Tab>  <C-O>:tabprev<CR>
endif

"
"}}}

" {{{ misc Autocommands
augroup Misc

	au FileType mail setlocal spell
	au FileType man setlocal nonu

augroup END

function s:MkNonExDir(file, buf)
	if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
		let dir=fnamemodify(a:file, ':h')
		if !isdirectory(dir)
			call mkdir(dir, 'p')
		endif
	endif
endfunction
augroup BWCCreateDir
	autocmd!
	autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

augroup Cache
	autocmd!
	autocmd BufRead,BufNewFile ~/Private/* setlocal directory=.
augroup END

"{{{ binary editing
augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END
"}}}

"}}}

"{{{ c header gates
function! s:insert_gates()
	let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	execute "normal! i#ifndef " . gatename
	execute "normal! o#define " . gatename
	execute "normal! Go#endif /* " . gatename . " */"
	normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

"}}}

" common mappings {{{

nnoremap <space> za
vnoremap <silent> . :normal .<CR>

map <Left>  <C-w>h
map <Down>  <C-w>j
map <Up>    <C-w>k
map <Right> <C-w>l

map <S-Left>  <C-w><
map <S-Right> <C-w>>
map <S-Down>  <C-w>-
map <S-Up>    <C-w>+

function! Auto_complete_string()
	if pumvisible() || (&completefunc == "" && &omnifunc == "")
		return "\<C-n>"
	elseif &completefunc != ""
		return "\<C-x>\<C-u>\<C-r>=Auto_complete_opened()\<CR>"
	else
		return "\<C-x>\<C-o>\<C-r>=Auto_complete_opened()\<CR>"
	end
endfunction

function! Auto_complete_opened()
	if pumvisible()
		return "\<C-n>"
	end
	return ""
endfunction

inoremap <expr> <Nul> Auto_complete_string()
inoremap <expr> <C-Space> Auto_complete_string()

inoremap <C-U> <C-G>u<C-U>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
nnoremap Y y$

map <C-L>         :noh<cr>:redraw!<cr>

map <F9>	   :make<CR>
map <silent> <F11> :TagbarToggle<cr>
map <leader>m  :make<CR>

map <C-Tab> <C-w><C-w>
imap <C-Tab> <esc><C-w><C-w>

vmap <silent> gs :sort<cr>

"}}}

command RC edit $MYVIMRC
command SRC source $MY VIMRC

" Unite {{{

call unite#filters#matcher_default#use(['matcher_fuzzy'])
map <silent> gb :<C-u>Unite -buffer-name=buffers -start-insert buffer<cr>
map <silent> gf :<C-u>Unite -buffer-name=files -start-insert file_rec/async:!<cr>

" }}}

" tags and taglist {{{

"map <silent> <Leader>t   :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . &>/dev/null<CR>:echo "tagsfile generated"<cr>

set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/boost

nmap <silent> <Insert> :TagbarToggle<CR>

" taglist}}}

"Git {{{
nmap <Leader>gu         :GitPush<CR>

nmap <Leader>gvc        :!git svn dcommit<CR>
nmap <Leader>gvf        :!git svn fetch<CR>
" Git }}}

" GPG {{{
augroup GPG
	au!
	au BufReadPost *.gpg %!gpg -d
	au BufReadPost *.gpg set ft=text
	au BufWritePre *.gpg %!gpg -e
	au BufWritePost *.gpg %!gpg -d
augroup END
" }}}

hi ErrorLine  ctermbg=52  ctermfg=fg  cterm=NONE
hi WarnLine   ctermbg=234 ctermfg=fg  cterm=NONE
hi SignHidden ctermbg=234 ctermfg=234 cterm=NONE
sign define error   linehl=ErrorLine
sign define warning linehl=WarnLine
sign define hidden  texthl=SignHidden

let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 0

" shows syntaxic group of the word under the cursor
command! SynStack :call SynStack()
function! SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" vi:foldmethod=marker sw=2

let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_disable_by_default = 1

let g:syntastic_tex_chktex_showmsg = 0
let g:syntastic_tex_chktex_args = '-n 1 -n 11'
let g:syntastic_tex_checkers = ['chktex']

function! ToggleMouse()
	if &mouse == 'a'
		set mouse=
	else
		set mouse=a
	endif
endfunc
command! Mouse :call ToggleMouse()

set mouse=

command! CD :cd %:h

let g:localvimrc_whitelist='/home/crater2150/code/.*'
let g:localvimrc_sandbox=0
" vim:fdm=marker
