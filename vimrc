set nocp
runtime packages 

"if empty(matchstr(getcwd(), "/home/crater2150"))
	set exrc
"endif

syntax on
filetype indent plugin on

set t_Co=256
set noerrorbells
set background=dark
colo rdark-terminal

set textwidth=80
if exists("&cc")
  set cc=+1
endif

set number

set tabstop=8
set shiftwidth=8

set foldmethod=syntax

set vb t_vb=

set shellcmdflag=-c
set shell=/bin/zsh\ +f

set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out,.o,.lo,
    \.class

set timeoutlen=500
set modeline

set hidden

if exists("&undofile")
  set undofile
  set undodir=~/.vim/undo/
endif

set backupdir=~/.vim/swap,~/tmp,~/
silent! call mkdir("/tmp/vimswap")
set directory=/tmp/vimswap//

set spelllang=de

let mapleader = "\\"

set ignorecase smartcase
set completeopt=menu,longest,preview
set wildmode=list:longest,list:full

if exists("&cm")
  set cm=blowfish
endif

"{{{ latex

let g:tex_flavor = "latex"
if exists("&cole")
  " conceal" Use conceal vim 7.3 feature:
  set cole=0	" conceal level
  " Conceal in tex file: "admgs", a=accents, d=delimiters, m=math symbols,
  " g=Greek, s=superscripts/subscripts:
  let g:tex_conceal="agm"
endif

"}}}

"{{{ ruby

autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete 
let g:rubycomplete_buffer_loading = 1 
let g:rubycomplete_classes_in_global = 1

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

if exists("*Pl#Theme#InsertSegment")
  let g:Powerline_cache_dir = simplify(expand("~/.vim/cache"))
  let g:Powerline_colorscheme = 'rdark'
  call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')
endif
"
"}}}

" {{{ misc Autocommands

au FileType mail setlocal spell
au FileType man setlocal nonu

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
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

"}}}

" common mappings {{{

imap <silent><C-E> <Esc>v`^me<Esc>gi<C-o>:call Ender()<CR>
function Ender()
  let endchar = nr2char(getchar())
  execute "normal \<End>a".endchar
  normal `e
endfunction

nnoremap <space> za
vnoremap <silent> . :normal .<CR>

map <M-l>    <C-w><l>
map <M-h>    <C-w><h>
map <M-k>    <C-w><k>
map <M-j>    <C-w><j>

map <C-L>         :noh<cr>:redraw!<cr>

map <F9>	   :make<CR>
map <silent> <F11> :TagbarToggle<cr>
map <leader>m  :make<CR>

map <C-Tab> <C-w><C-w>
imap <C-Tab> <esc><C-w><C-w>

map <silent> gb :FufBuffer<cr>
map <silent> gf :FufFile<cr>

"}}}

command RC edit ~/.vim/vimrc
command SRC source ~/.vim/vimrc

nmap <silent> <Del> :NERDTreeToggle<CR>

" Fuzzyfinder {{{

nnoremap <silent> <Leader>b :FufBuffer<CR>
nnoremap <silent> <Leader>ft :FufTags<CR>
nnoremap <silent> <Leader>o :FufCoverageFile<CR>
nnoremap <silent> <Leader>cd :FufDir<CR>

" }}}

" tags and taglist {{{

map <silent> <Leader>t   :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . &>/dev/null<CR>:echo "tagsfile generated"<cr>

set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/boost

let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=1
let Tlist_Use_Right_Window=1
let Tlist_Display_Prototype=1

nmap <silent> <Insert> :TlistToggle<CR>

" taglist}}}

"Git {{{
nmap <Leader>gu         :GitPush<CR>

nmap <Leader>gvc        :!git svn dcommit<CR>
nmap <Leader>gvf        :!git svn fetch<CR>
" Git }}}


sign define error linehl=ErrorLine
sign define warning linehl=WarnLine
sign define hidden texthl=SignHidden

let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 0

" vi:foldmethod=marker sw=2
