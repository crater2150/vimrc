set t_Co=256
set background=dark
set number
set tabstop=4
set cindent
set shiftwidth=4
set expandtab 
set foldmethod=marker
set shellcmdflag=-c
set shell=/bin/zsh\ +f
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.info,.aux,.log,.dvi,.bbl,.out,.o,.lo,
    \.class

colo rdark-terminal

set statusline=%0*%{GitBranchInfoString()}\ %<%f%h%m%r\ \ 
    \%1*%{Tlist_Get_Tag_Prototype_By_Line()}
    \%0*%=%b\ 0x%B\ \ %l,%c%V\ %P
set laststatus=2

au BufNewFile,Bufread *.php,*.php3,*.php4 set keywordprg="help"
au BufWinEnter * let w:m1=matchadd('nearLineEnd', '\%<81v.\%>78v', -1)
au BufWinEnter * let w:m2=matchadd('atLineEnd', '\%>80v.\+', -1)

map <C-M-Right>     <C-w><Right>
map <C-M-Left>      <C-w><Left>
map <C-M-Up>        <C-w><Up>
map <C-M-Down>      <C-w><Down>
map <S-Tab>         <C-w><C-w>

imap <silent><C-E> <Esc>v`^me<Esc>gi<C-o>:call Ender()<CR>
function Ender()
  let endchar = nr2char(getchar())
  execute "normal \<End>a".endchar
  normal `e
endfunction


nnoremap <space> za

map <M-Up>        dd<Up><Up>p
imap <M-Up>       <Esc>dd<Up><Up>pi
vmap <M-Up>       dd<Up><Up>p

map <M-Down>      ddp
imap <M-Down>     <Esc>ddpi

map <C-c>	:noh<CR>

map <F1>	:mksession! Session.vim<CR>:wqall<CR>
map <F12>	:tabnew<CR>
map <F9>	:make<CR>
map <F8>	:make test<CR>
map ;w		i<Home>#<ESC><Down>
map ;n		:tabnew<cr>


command RC edit ~/.vimrc
command SRC source ~/.vimrc

nmap <silent> <Del> :NERDTreeToggle<CR>

" taglist {{{

let Tlist_Exit_OnlyWindow=1
let Tlist_Process_File_Always=1
let Tlist_Use_Right_Window=1

nmap <silent> <Insert> :TlistToggle<CR>

" taglist}}}

"Git {{{
nmap <Leader>gu         :GitPush<CR>

nmap <Leader>gvc        :!git svn dcommit<CR>
nmap <Leader>gvf        :!git svn fetch<CR>
" Git }}}

" Java {{{
autocmd BufNewFile *.java call InsertJavaPackage()
function! InsertJavaPackage()
    let dir = getcwd()
    let dir = substitute(dir, "^.*\/src\/", "", "")
    let dir = substitute(dir, "\/", ".", "g")
    let dir = "package " . dir . ";"
    let result = append(0, "")
    let result = append(1, dir)
    let filename = expand("%")
    let filename = substitute(filename, "\.java", "", "")
    let result = append(2, "")
    let result = append(3, "class " . filename . " {")
    let result = append(4, "}")
endfunction

" Configuration for jcommenter
"
" map the commenter:
map <Leader>jd :call JCommentWriter()<CR>

" map searching for invalid comments. meta-n for next invalid comment, meta-p
" for previous. "Invalid" in this case means that the "main" comments are missing
" or the tag description is missing. Handy when searching for missing comments
" or when jumping to next tag (no need to use cursor keys (yuck!) or quit insert
" mode).
map <Leader>jn :call SearchInvalidComment(0)<cr>
map <Leader>jN :call SearchInvalidComment(1)<cr>

" modeline:
let b:jcommenter_modeline = "/* vim: set " . (&et ? "et" : "noet") . " sw=" . &sw . " ts=" . &ts . ": */"
.
" A way to automate the creation of the comments. Works only if the
" class/method declaration is on one row. Comments are generated when the
" beginning '{' is entered, if the proper function/class declaration is found.
" Should work independet of the location of the '{'. Recognizing whether the 
" '{' starts a class/method or something else might fail, and comments might
" be generated for example for an 'if' clause. Has not happened yet, though.
" Uncomment to activate:
"imap <silent> { {<esc>:call search('\w', 'b')<cr>:call ConditionalWriter()<cr>0:call search('{')<cr>a

" a nice trick:
" If you type '}-' and a space/enter/esc, jcommenter will be
" automatically called on the function/class declaration whose end the '}' is:
iabbrev }- }<esc>h%?\w<cr>:nohl<cr>:call JCommentWriter()<cr>

" Move cursor to the place where inserting comments supposedly should start
let b:jcommenter_move_cursor = 1

" Defines whether to move the cursor to the line which has "/**", or the line
" after that (effective only if b:jcommenter_move_cursor is enabled)
let b:jcommenter_description_starts_from_first_line = 0

" Start insert mode after calling the commenter. Effective only if 
" b:jcommenter_move_cursor is enabled.
let b:jcommenter_autostart_insert_mode = 1

" The number of empty rows (containing only the star) to be added for the 
" description of the method
let b:jcommenter_method_description_space = 2

" The number of empty rows (containing only the star) to be added for the´
" description of the field. Can be also -1, which means that "/**  */" is added
" above the field declaration 
let b:jcommenter_field_description_space = 1

" The number of empty rows (containing only the star) to be added for the 
" description of the class
let b:jcommenter_class_description_space = 2

" If this option is enabled, and a method has no exceptions, parameters or
" return value, the space for the description of that method is allways one
" row. This is handy if you want to keep an empty line between the description
" and the tags, as is defined in Sun's java code conventions
let b:jcommenter_smart_method_description_spacing = 1

" the default content for the author-tag of class-comments. Leave empty to add
" just the empty tag, or outcomment to prevent author tag generation
let b:jcommenter_class_author = ''

" the default content for the version-tag of class-comments. Leave empty to add
" just the empty tag, or outcomment to prevent version tag generation
let b:jcommenter_class_version = ''

" The default author added to the file comments. leave empty to add just the
" field where the autor can be added, or outcomment to remove it.
let b:jcommenter_file_author = ''

" The default copyright holder added to the file comments. leave empty to
" add just the field where the copyright info can be added, or outcomment
" to remove it.
let b:jcommenter_file_copyright = ''

" Change this to true, if you want to use "@exception" instead of "@throws".
let b:jcommenter_use_exception_tag = 0

" set to true if you don't like the automatically added "created"-time
let b:jcommenter_file_noautotime = 0 

" define whether jcommenter tries to parse and update the existing Doc-comments
" on the item it was executed on. If this feature is disabled, a completely new
" comment-template is written
let b:jcommenter_update_comments = 1

" If you want to put some text where the parameter text, return text etc. would
" normally go, uncomment and add the wanted text to these variables (this feature
" is considered "unsupported", which means it will not work perfectly with every
" other aspect of this script. For example, this will break the logic used to
" find "invalid" comments, see mappings above):
"let b:jcommenter_default_param  = ''
"let b:jcommenter_default_return = ''
"let b:jcommenter_default_throw  = ''

" Another "unsupported" feature: define the number of lines added after each
" "tag-group" (except exceptions, which is often the last group). does not work
" well with comment updating currently:
"let b:jcommenter_tag_space = 1


" define wheter jcommenter should remove old tags (eg. if the return value was
" changed from int to void). Will not work for exceptions, since it should not
" remove RuntimeExceptions, and recognizing whether an exception is RTE is very
" hard.
" This feature is not throughly tested, and might delete something it was not
" supposed to, so use with care. Only applicable if 
" b:jcommenter_update_comments is enabled.
let b:jcommenter_remove_tags_on_update = 1

" Whether to prepend an empty line before the generated comment, if the
" line just above the comment would otherwise be non-empty.
let b:jcommenter_add_empty_line = 1

" Uncomment and modify if you're not happy with the default file
" comment-template:
"function! JCommenter_OwnFileComments()
"  call append(0, '/* File name   : ' . bufname("%"))
"  call append(1, ' * authors     : ')
"  call append(2, ' * created     : ' . strftime("%c"))
"  call append(3, ' *')
"  call append(4, ' */')
"endfunction


" --- cut here (configuration) ---
" Java }}}
