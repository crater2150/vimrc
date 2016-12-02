" Each theme is contained in its own file and declares variables scoped to the
" file.  These variables represent the possible "modes" that airline can
" detect.  The mode is the return value of mode(), which gets converted to a
" readable string.  The following is a list currently supported modes: normal,
" insert, replace, visual, and inactive.
"
" Each mode can also have overrides.  These are small changes to the mode that
" don't require a completely different look.  "modified" and "paste" are two
" such supported overrides.  These are simply suffixed to the major mode,
" separated by an underscore.  For example, "normal_modified" would be normal
" mode where the current buffer is modified.
"
" The theming algorithm is a 2-pass system where the mode will draw over all
" parts of the statusline, and then the override is applied after.  This means
" it is possible to specify a subset of the theme in overrides, as it will
" simply overwrite the previous colors.  If you want simultaneous overrides,
" then they will need to change different parts of the statusline so they do
" not conflict with each other.
"
" First, let's define an empty dictionary and assign it to the "palette"
" variable. The # is a separator that maps with the directory structure. If
" you get this wrong, Vim will complain loudly.
let g:airline#themes#pastel#palette = {}

" First let's define some arrays. The s: is just a VimL thing for scoping the
" variables to the current script. Without this, these variables would be
" declared globally. Now let's declare some colors for normal mode and add it
" to the dictionary.  The array is in the format:
" [ guifg, guibg, ctermfg, ctermbg, opts ]. See "help attr-list" for valid
" values for the "opt" value.


let s:gcolors = {
\	'blue':        '#00afff',
\	'lightblue':   '#87afff',
\	'orange':      '#ffaf5f',
\	'yellow':      '#ffd75f',
\	'green':       '#87d75f',
\	'red':         '#ff0000',
\	'lightred':    '#ff5f5f',
\	'white':       '#ffffff',
\	'lightgray':   '#c6c6c6',
\	'gray':        '#8a8a8a',
\	'bggray':      '#1c1c1c',
\	'lightbggray': '#262626',
\	'visualgray':  '#303030',
\	'inherit':     ''
\}

let s:tcolors = {
\	'blue':         39,
\	'lightblue':   111,
\	'orange':      215,
\	'yellow':      221,
\	'green':       113,
\	'red':         196,
\	'lightred':    203,
\	'white':       255,
\	'lightgray':   251,
\	'gray':        244,
\	'bggray':      234,
\	'lightbggray': 235,
\	'visualgray':  236,
\	'inherit':     ''
\}

function! GetColors(fg, bg, ...)
	if a:0 > 0
		return [ s:gcolors[a:fg], s:gcolors[a:bg], s:tcolors[a:fg], s:tcolors[a:bg], a:1 ]
	else
		return [ s:gcolors[a:fg], s:gcolors[a:bg], s:tcolors[a:fg], s:tcolors[a:bg] ]
	end
endfunction

let s:N1   = GetColors('blue', 'bggray')
let s:N2   = GetColors('white', 'visualgray')
let s:N3   = GetColors('lightgray', 'bggray', 'NONE')
	let g:airline#themes#pastel#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Here we define overrides for when the buffer is modified.  This will be
" applied after g:airline#themes#pastel#palette.normal, hence why only certain keys are
" declared.
let g:airline#themes#pastel#palette.normal_modified = {
      \ 'airline_c': GetColors('lightred', 'bggray', 'italic')
      \ }


let s:I1 = GetColors('bggray', 'green')
let s:I2 = GetColors('green',  'visualgray')
let s:I3 = GetColors('green',  'bggray')
let g:airline#themes#pastel#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#pastel#palette.insert_modified = {
      \ 'airline_c': GetColors('lightred', 'bggray', 'italic')
      \ }
let g:airline#themes#pastel#palette.insert_paste = {
      \ 'airline_a': GetColors('bggray', 'green', 'italic')
      \ }


let g:airline#themes#pastel#palette.replace = copy(g:airline#themes#pastel#palette.insert)
let g:airline#themes#pastel#palette.replace.airline_a = [ s:I2[0]   , '#af0000' , s:I2[2] , 124     , ''     ]
let g:airline#themes#pastel#palette.replace_modified = g:airline#themes#pastel#palette.insert_modified

let s:V1 = GetColors('bggray', 'orange')
let s:V2 = GetColors('orange',  'visualgray')
let s:V3 = GetColors('orange',  'bggray')

let g:airline#themes#pastel#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#pastel#palette.visual_modified = {
      \ 'airline_c': GetColors('lightred', 'bggray', 'italic')
      \ }


let s:IA1 = GetColors('visualgray', 'bggray')
let s:IA2 = GetColors('visualgray', 'bggray')
let s:IA3 = GetColors('gray', 'bggray')
let g:airline#themes#pastel#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#pastel#palette.inactive_modified = {
      \ 'airline_c': GetColors('lightred', 'bggray', 'italic')
      \ }


" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#pastel#palette.accents = {
      \ 'red': GetColors('red','inherit')
      \ }

