set nocp
if empty(matchstr(getcwd(), "/home/crater2150"))
	set exrc
endif

filetype indent plugin on

set t_Co=256
set background=dark
colo rdark-terminal

set textwidth=80
set cc=+1

set number

set tabstop=8
set shiftwidth=8

set foldmethod=syntax

set shellcmdflag=-c
set shell=/bin/zsh\ +f

set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out,.o,.lo,
    \.class

set timeoutlen=500
set modeline

set undofile
set undodir=~/.vim/undo/
set backupdir=~/.vim/swap,~/tmp,~/

set ignorecase smartcase
set completeopt=menu,longest,preview
set wildmode=list:longest,list:full

set cm=blowfish

" conceal" Use conceal vim 7.3 feature:
set cole=2	" conceal level
" set cocu=n	" conceal cursor /when set to n typing is not very pleasant/
" Conceal in tex file: "admgs", a=accents, d=delimiters, m=math symbols,
" g=Greek, s=superscripts/subscripts:
let g:tex_conceal="adgm"

let mapleader = "\\"

call pathogen#runtime_append_all_bundles() 

" set statusline=%0*%{GitBranchInfoString()}\ %<%f%h%m%r\ \ 
"    \%1*%{Tlist_Get_Tag_Prototype_By_Line()}
"    \%0*%=%b\ 0x%B\ \ %l,%c%V\ %P
set statusline=%0*\ %<%f%h%m%r\ \ 
    \%0*%=%b\ 0x%B\ \ %l,%c%V\ %P\ %y
"
set laststatus=2

" tabline {{{
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

"}}}

" Autocommands {{{

au BufNewFile,Bufread *.php,*.php3,*.php4 set keywordprg="help"
"au BufWinEnter * let w:m1=matchadd('nearLineEnd', '\%<81v.\%>78v', -1)
"au BufWinEnter * let w:m2=matchadd('atLineEnd', '\%>80v.\+', -1)

au FileType mail setlocal spell
au FileType man setlocal nonu

" vim -b : edit binary using xxd-format!                               
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
map <leader>m  :make<CR>

map <C-Tab> <C-w><C-w>
imap <C-Tab> <esc><C-w><C-w>

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


" zencoding {{{
"
let g:user_zen_settings = {
  \  'indentation' : '  ',
  \  'perl' : {
  \    'aliases' : {
  \      'req' : 'require '
  \    },
  \    'snippets' : {
  \      'use' : "use strict\nuse warnings\n\n",
  \      'warn' : "warn \"|\";",
  \    }
  \  }
  \}

let g:user_zen_expandabbr_key = '<Leader>e'
let g:user_zen_leader_key = '<Leader>z'

"}}}

" vi:foldmethod=marker
