let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_section_z = ''

"let g:Powerline_cache_dir = simplify(expand("~/.cache/vim/powerline"))
"let g:Powerline_symbols = 'unicode'
"let g:Powerline_theme = 'custom'
"let g:Powerline_colorscheme = 'rdark'
"let g:Powerline_dividers_override = [' ', ' ', ' ', ' ']

if exists(":SpeedDatingFormat!")
	SpeedDatingFormat! %v
	SpeedDatingFormat! %^v
endif

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_selecta'])

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	nmap <buffer> <ESC> <Plug>(unite_exit)
	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)

endfunction

nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>
