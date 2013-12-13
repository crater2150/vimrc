iab <buffer> syso System.out.println

setlocal foldmethod=syntax
setlocal foldenable
setlocal textwidth=120

nnoremap <silent> <buffer> <leader>jc :JavaCorrect<cr>
nnoremap <silent> <buffer> <leader>jd :JavaDocComment<cr>
nnoremap <silent> <buffer> <F2>       :JavaDocPreview<cr>
nnoremap <silent> <buffer> <F3>       :JavaSearchContext<cr>
nnoremap <silent> <buffer> <leader>jf :%JavaFormat<cr>
nnoremap <silent> <buffer> <leader>ji :JavaImportOrganize<cr>
nnoremap          <buffer> <leader>jr :JavaRename<space>

let g:EclimProjectTreeAutoOpen=1 
let g:EclimProjectTreeExpandPathOnOpen=1
let g:EclimProjectTreeSharedInstance=1  "share tree instance through all tabs
" use tabnew instead of split for new action
let g:EclimProjectTreeActions = [ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'} ]

function! InsertJavaPackage()
  let filename = expand("%")
  let filename = substitute(filename, "\.java$", "", "")
  let dir = getcwd() . "/" . filename
  let dir = substitute(dir, "^.*\/src\/", "", "")
  let dir = substitute(dir, "\/[^\/]*$", "", "")
  let dir = substitute(dir, "\/", ".", "g")
  let filename = substitute(filename, "^.*\/", "", "")
  let dir = "package " . dir . ";"
  let result = append(0, dir)
  let result = append(1, "")
  let result = append(2, "class " . filename . " {")
  let result = append(4, "}")
endfunction

"java {{{
if filereadable(bufname("%")) == 0
	call InsertJavaPackage()
endif

exe "sign place 9999 name=hidden line=1 file=" . expand("%:p")
"}}}
