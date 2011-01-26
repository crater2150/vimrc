
" my filetype file
if exists("did_load_filetypes")
	finish
endif
	au! BufNewFile,BufRead *.text     setf markdown
	au! BufNewFile,BufRead *.text     set syntax=markdown

	au! BufNewFile,BufRead *.m     setf octave
	au! BufNewFile,BufRead *.m     set syntax=matlab

	au! BufRead,BufNewFile *.md		setf markdown
	au! BufNewFile,BufRead *.md     set syntax=markdown
