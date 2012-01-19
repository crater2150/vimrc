" This is my personal atprc file for Automatic Tex Plugin.
" Written by: Marcin Szamotulski

" Vim Options:
" {{{
" With this settings ATP will overwrite the normal r command (:help atp-r) and make difference with % command: when g:atp_VimCompatible=0 % will act on many lines, when 1 only in the current l line (the default is 0):
     let g:atp_VimCompatible=1
" }}}

" Aliases: (using vimscript#745 CmdAlias)
" {{{
if globpath(&rtp, "plugin/cmdalias.vim") != ""
    Alias tex TEX
    Alias toc TOC
"  Long commands - anyway I tend to use TAB to complete them.
"     Alias bibtex Bibtex
"     Alias makelatex MakeLatex
endif
" }}}

" Compiler:
" {{{
" This variables has to possible values: "python" and "bash". With python you need
" python or python3 vim features (:help +python, :help +python3). By default
" it is equal to python. This chooses the compiler script to make TeX files.
"     let g:atp_Compiler		= "python"

" This variable sets the python executable (the default value is platform
" dependent)
"     let g:atp_Python			= "python"

" map <buffer> <silent> >E <Plug>JumptoNextEnvironmentzt

" Files with this extensions will be compied back and forth to/from temporary
" directory in which compelation happens (each process own a private directory
" under: b:atp_TempDir).
"     let g:keep=[ "log", "aux", "toc", "bbl", "ind", "synctex.gz", "blg", "loa", "toc", "lot", "lof", "thm", "out" ]
" The log file is only copied back, aux file is copied back if the compelation
" returened without errors. If it returns with errors it is only copied to file
" with extension aux_atp (or something alike).

"     let &l:complete.=",k".globpath(&rtp, "ftplugin/ATP_files/dictionaries/dictionary").",k".globpath(&rtp, "ftplugin/ATP_files/dictionaries/SIunits")

" ATP uses two values for vim updatetime option: one for insert mode and
" another for normal mode. Note that ATP overwrite vim updatetime option.
    let g:atp_updatetime_insert		= 4000
    let g:atp_updatetime_normal		= 2000

" How to compare the file:
" This variables sets how to compare if the buffer has changed. There are
" basically to modes 'changedtick' which compares b:changedtick vim variable
" with b:atp_changedtick, or compare the buffer and the file written on disc.
" The variable has two values 'changedtick' and anything else corresponding to
" these two modes:
"     let g:atp_Compare				= "changedtick"
"
" If you set g:atp_Compare to soething else than 'changedtick' the file and
" buffer will be compared. These two variables if some elements will be
" skipped. Note that these settings might make the comparing procedure go
" slightly longer (the time consuming part is erasing comments and blank
" lines, not comparing them).

" If set to 0 embedded comments are not compared:
"     let g:atp_compare_embedded_comments	= 1
" If set to 0 ammount of emty lines are irrelevant:
"     let g:atp_compare_double_empty_lines	= 0

" The variable b:atp_autex turns on (1)/off (0) automatic tex processing:
    au BufEnter ~/.vim/* let b:atp_autex = 0
"}}}

" Debug Mode:
" {{{
" This defines default debug mode:
"     let g:atp_DefaultDebugMode		= "silent"
" This defines default error format. 
"     let g:atp_DefaultErrorFormat		= "erc"
" }}}

" Call Back:
" {{{
" ALl this options are used by call back function which runs after
" compelation (:TEX, :Bibtex, but also background compelation).
"
" If you want to turn off Progress Bar in status line set this variable to 0:
"     let g:atp_ProgressBar		= 1

" By default this variable stores cmheight. The vim option 'cmdheight' is
" toggled by ATP. In debug mode command-line is make bigger. See the next
" variable.
"     let g:atp_cmdheight			= &l:cmdheight

" ATP makes command-line that big in debug mode:
    let g:atp_DebugModeCmdHeight 	= 2

" Max Window Height of :Dsearch command:
"     let g:atp_DSearchMaxWindowHeight	= 15

" This defines maximal height of Quick Fix window. ATP computes the window heihgt!
"     let g:atp_DebugModeQuickFixHeight = 8

" If you want that background compelation also changes 'cmdheight' option set
" this to 1, the default is 0.
"     let g:atp_DebugMode_AU_change_cmdheight = 0

" This is only valid for Xpdf viewer. If set to 1 it will reload the file even
" if compelation returned with non zero exit code (the default is 1).
    let b:atp_ReloadOnError		= 1

" If you set this variable to 1 (defult is 0) after each compelation errors in
" the tex buffer will be highlighted.
"     let g:atp_HighlightErrors 		= 0

" You can set the highlighting group. Errors are devided into to two groups:
" errors and all the others. If you set it to "" the corresponding type of
" errors will not gethighlighted.
"     let g:atp_Highlight_ErrorGroup 	= "Error"
"     let g:atp_Highlight_WarningGroup 	= ""

" This variable triggers some optiosn in insert mode, while edditing
" mathematics.
"     let g:atp_MathVimOptions		= { 'linebreak' : [ 'nolinebreak', 'linebreak' ], 'textwidth' : [ 90, 78]}
" It is a dictionary with keys: names of vim options, and values: tuples:
" [ 'math_setting', 'non_math_setting' ].

" By default ATP fires :cgetfile when entering new buffer (BufEnter
" autocommand group), if you want to turn it off set this variable to 0: 
"     let g:atp_cgetfile = 1
" }}}

" Search:
" {{{
" The default value of g:atp_mapNn is 1 in project files and 0 in non project
" files.
" This the trick to set g:atp_mapNn to 0 for project files as well.
" 	au VimEnter *.tex let g:atp_mapNn	= 0

" If you use version control system, and you share the .project.vim file you
" might want to use g:atp_RelativePath to 1 (actually this is the default)
"     let g:atp_RelativePath 			= 1
" You might try setting this to 0 when you have problems with using atp-:S
" command, use S! (to regenerate the project file tree)

"     let g:atp_tex_extensions = ['tex.project.vim', 'aux', 'log', 'bbl', 'blg', 'spl', 'snm', 'nav', 'thm', 'brf', 'out', 'toc', 'mpx', 'idx', 'ind', 'ilg', 'maf', 'blg', 'glo', 'mtc[0-9]', 'mtc1[0-9]', 'pdfsync', 'synctex.gz', 'tag']
" I added tag extension.

"    let g:atp_LibraryPath 	= "/home/coot/prace/**/,/home/coot/ksiazki/**/"
    " By default this variable is set to 0.

"     let g:printeroptions	= "-P xerox-p5 -o sides=two-sided-long-edge"

" Use python search engine (and python regexp) for bibsearch
" in :BibSearch and by Tab Completion.
"     let g:atp_bibsearch 	= "python"
" }}}

" Project Variables:
" {{{
"     let b:atp_ProjectScript 	= 0

"     let g:atp_ProjectLocalVariables = [
" 		\ "b:atp_MainFile", 	"g:atp_mapNn", 		"b:atp_autex", 
" 		\ "b:atp_TexCompiler", 	"b:atp_TexOptions", 	"b:atp_TexFlavor", 	
" 		\ "b:atp_OutDir", 	"b:atp_auruns", 	"b:atp_ReloadOnError", 	
" 		\ "b:atp_OpenViewer", 	"b:atp_XpdfServer",	"b:atp_ProjectDir", 	
" 		\ "b:atp_Viewer", 	"b:TreeOfFiles",	"b:ListOfFiles", 	
" 		\ "b:TypeDict", 	"b:LevelDict", 		"b:atp_BibCompiler", 
" 		\ "b:atp_StarEnvDefault", 	"b:atp_StarMathEnvDefault", 
" 		\ "b:atp_updatetime_insert", 	"b:atp_updatetime_normal",
" 		\ ] 
if exists('g:atp_ProjectLocalVariables')
    " The if statement is used since atprc file is source twice.
    call add(g:atp_ProjectLocalVariables, 'g:atp_imap_tilde_braces')
"     call remove(g:atp_ProjectLocalVariables, 'b:atp_Viewer')
endif
" }}}

" Viewer Settings:
" {{{
     let b:atp_Viewer		= 'pdfview'
function! <SID>SetXpdf()
    if b:atp_TexCompiler == "pdflatex"
	:SetXpdf
    endif
endfunction
" au VimEnter *.tex 		:call <SID>SetXpdf()
" these variables should be a vim lists of viewer options:
"     let b:atp_xpdfOptions 	= ["-bg", "NavajoWhite4", "-fg", "black", "-mattecolor", "burlywood"]
"     let g:xpdfOptions		= ["-bg", "Grey30", "-mattecolor", "SlateBlue2", "-papercolor", "White"]
"     let b:atp_xdviOptions	= ["-expertmode", "0", "-s", "6"]

command! -buffer	Xdvi	:call SetXdvi()
command! -buffer	Xpdf	:call Set('xpdf')
command! -buffer	Okular	:call SetPdf('okular')

"     let g:atp_SyncXpdfLog	= 1
"
" This variable sets the time between sending commands to Xpdf. There is a bug
" in Xpdf, and this is the work around. You might  need to set this for higher
" value. This might make :SyncTex (forward search) working better. (Xpdf
" should find the page and line)
"     let g:atp_XpdfSleepTime 	= 0.1

" List of viewers which needs to be reloaded to refresh the contents after
" compilation. Now only "xpdf" is supported.
"     let g:atp_ReloadViewers	= [ "xpdf" ] 
" }}}
"
    let g:atp_developer		= 0
    " The default value is 0

"     let b:toc_window_width	= 45
"     let b:labels_window_width	= 45
" These are nice shortcuts for :SetXdvi and :SetXpdf, :SetXdvi, :SetOkular.

" MAPS:
" {{{
" Disable LatexBox maps
"     let g:no_atp_maps 	= 1
"     let g:atp_no_tab_map	= 1
"     let g:LatexBox_no_mappings= 1
"     let g:LatexBox_maps	= 0

if &l:cpoptions =~# "B"
    let maplocalleader		= "\\"
else
    let maplocalleader		= "\\\\"
endif
" You can also change mapleader:
" (this is my setting and it should be done in vimrc file)
" let mapleader 		= "="

" These two variables sets keys which will be mapped to [un]comment:
" The default are "-c" and "-u":
"     let g:atp_map_Comment 	= "-c"
    let g:atp_map_UnComment 	= "-C"
" }}}

" NMAPS:
" {{{
" The following two variables define leaders for motion commands: move to next
" part/chapter/section/.../math/... (default values '>' and '<').
    let g:atp_map_forward_motion_leader 	= ">"
    let g:atp_map_backward_motion_leader 	= "<"
" If you set them to [:] for example the vim ]s and [s will not work.
" If you set them to {:} the vim normal commands { and } will not work.

" Leader for jumping to section (the section number supplied by count)
" the resulting map is -s (with default leader -)
"     let g:atp_goto_section_leader		= "-"

" This key sequence is used to select comments (from normal mode):
"     let g:atp_MapSelectComment		= "_c"


" nmap Q/		q/:call ATP_CmdwinToggleSpace('on')<CR>i
" nmap Q?		q?:call ATP_CmdwinToggleSpace('on')<CR>i

" This sets color wrappers that might be usefull:
vmap _red	:WrapSelection \textcolor{VioletRed3}{<CR>
vmap _blue	:WrapSelection \textcolor{SlateBlue}{<CR>

"     let g:atp_grab_nN 	= 0
"
" This defines string put by \c (comment lines) and deleted by \u (uncomment lines):
"     let g:atp_CommentLeader	= '% '
" To set keys to these maps browse for g:atp_map_Comment and
" g:atp_map_UnComment in map section.
"
" If you do not want define \c (coment lines) and \u (uncomment lines) maps,
" set this variable to 0:
"     let g:atp_MapCommentLines	= 1
" }}}

" IMAPS: 
" {{{
" Disable some sets of maps:
"     let g:atp_no_env_maps	= 1

" Imap Leaders:
" {{{ Imap Leaders

" g:atp_imap_first_leader is used for greek letters, but also for some
" mathematical symbols.
"     let g:atp_imap_leader_1	= '#'

" g:atp_imap_second_leader is used for fonts in both normal and visual maps,
" e.g. \textrm{}, etc. The default is "##", "_" might be a better choice.
     let g:atp_imap_leader_2	= "_"

" g:atp_imap_third_leader is used for environment imaps:
" in next sections you can define the keys and names corresponding to
" environments that you use.
"     let g:atp_imap_leader_3	= "]"

" g:atp_imap_over_leader (default "`") is used for diacritic imaps and for
" some mathematical decorations
let g:atp_imap_over_leader 		= "'"

" g:atp_infty_leader (default g:atp_imap_first_leader, unless it is equal to "#", 
" then it is set to "`", hence the default value is "`") It is used just for
" two maps `6 -- \partial and `8 -- \infty.
let g:atp_infty_leader			= "'"
" }}}

" Imap Miscelenious Settings {{{
"
" If this variable is set to 1 <C-C> in insert mode is mapped to ^[ (<Esc>).
" Then <C-C> will retrigger InsertLeave autocommands (and thus ATP will adjust
" updatetime vim option.
"     let g:atp_IMapCC			= 0

" If you set g:atp_imap_ShortEnvIMaps = 0 then the environment imaps will use
" one letter abbreviations, e.g. ]t -> \begin{theorem}:\end{theorem}, if set
" to 1 three letter abbreviations are used, e.g. ]the.
    let g:atp_imap_ShortEnvIMaps	= 0

" g:atp_imap_over_leader is used for accents and additions which appear above
" the letter, `^ -> \widehat{}, `v -> \check{}, etc.
"     let g:atp_imap_over_leader	= "`"

" These two variables defines keys to be imaped to _{} and ^{}. If you do not
" use '_' and '^' as a leader you can set them to '_' and '^' and they will
" work even better.
"     let g:atp_imap_subscript		= "__"
"     let g:atp_imap_supscript		= "^"

" Make \widetile{}, \widehat{} (when 1 - the default) or \tilde{}, \hat{} maps
" (when set to 0)
    let g:atp_imap_wide		= 1

" By default: if you use g:atp_Imap_ShortEnvIMaps = 0 there is a map ]let to
" the letter environment (if g:atp_Imap_ShortEnvIMaps = 1 it is not defined,
" the default of g:atp_Imap_ShortEnvIMaps is 0). These variables hold text put
" insice \opening{} and \closing{} LaTeX commands.
"     let g:atp_letter_opening		= ""
"     let g:atp_letter_closing		= ""

" If set to 1 some sets of maps will be defined (the default is 1)
" if set to 0 they will not be defined.

" To get maps defined in g:atp_imap_fonts variable:
"     let g:atp_imap_define_fonts 	= 1

" To get maps defined in g:atp_imap_greek_letters variable:
"     let g:atp_imap_define_greek_letters = 1

" To get maps defined in g:atp_imap_math variable:
"     let g:atp_imap_define_math	= 1

" To get maps defined in g:atp_imap_math_misc variable:
"     let g:atp_imap_define_math_misc 	= 1

" To get maps defined in g:atp_imap_environments variable:
"     let g:atp_imap_define_environments = 1
" }}}
" {{{ Environment IMap keys
" This set of variables are used for imap keys for some LaTeX environments.
" The leader which is used is defined by g:atp_imap_third_leader.
" Note that also the environment name is configurable (see next section).
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_bibliography="B"
" else
"     let g:atp_imap_bibliography="bib"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_begin="b"
" else
"     let g:atp_imap_begin="beg"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_end="e"
" else
"     let g:atp_imap_end="end"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_theorem="t"
" else
"     let g:atp_imap_theorem="the"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_definition="d"
" else
"     let g:atp_imap_definition="def"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_proposition="P"
" else
"     let g:atp_imap_proposition="Pro"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_lemma="l"
" else
"     let g:atp_imap_lemma="lem"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_remark="r"
" else
"     let g:atp_imap_remark="rem"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_corollary="c"
" else
"     let g:atp_imap_corollary="cor"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_proof="p"
" else
"     let g:atp_imap_proof="pro"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_example="x"
" else
"     let g:atp_imap_example="exa"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_note="n"
" else
"     let g:atp_imap_note="not"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_enumerate="E"
" else
"     let g:atp_imap_enumerate="enu"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_itemize="I"
" else
"     let g:atp_imap_itemize="ite"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_item="i"
" else
"     let g:atp_imap_item="I"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_align="a"
" else
"     let g:atp_imap_align="ali"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_abstract="A"
" else
"     let g:atp_imap_abstract="abs"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_equation="q"
" else
"     let g:atp_imap_equation="equ"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_center="C"
" else
"     let g:atp_imap_center="cen"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_flushleft="L"
" else
"     let g:atp_imap_flushleft="lef"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_flushright="R"
" else
"     let g:atp_imap_flushright="rig"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_tikzpicture="T"
" else
"     let g:atp_imap_tikzpicture="tik"
" endif
" if g:atp_imap_ShortEnvIMaps
"     let g:atp_imap_frame="f"
" else
"     let g:atp_imap_frame="fra"
" endif
"
" }}}
" {{{ Environment IMap names
" This are names of environments that are inserted by imaps defined by ATP.
" The imap keys that are used are in previous section. The leader is defined
" by g:atp_imap_third_leader.
" if !exists("g:atp_EnvNameTheorem") || g:atp_reload_variables
"     let g:atp_EnvNameTheorem="theorem"
" endif
" if !exists("g:atp_EnvNameDefinition") || g:atp_reload_variables
"     let g:atp_EnvNameDefinition="definition"
" endif
" if !exists("g:atp_EnvNameProposition") || g:atp_reload_variables
"     let g:atp_EnvNameProposition="proposition"
" endif
" if !exists("g:atp_EnvNameObservation") || g:atp_reload_variables
"     " This mapping is defined only in old layout:
"     " i.e. if g:atp_env_maps_old == 1
"     let g:atp_EnvNameObservation="observation"
" endif
" if !exists("g:atp_EnvNameLemma") || g:atp_reload_variables
"     let g:atp_EnvNameLemma="lemma"
" endif
" if !exists("g:atp_EnvNameNote") || g:atp_reload_variables
"     let g:atp_EnvNameNote="note"
" endif
" if !exists("g:atp_EnvNameCorollary") || g:atp_reload_variables
"     let g:atp_EnvNameCorollary="corollary"
" endif
" if !exists("g:atp_EnvNameRemark") || g:atp_reload_variables
"     let g:atp_EnvNameRemark="remark"
" endif
" }}}
" {{{ Imap Defining Variables 
" This is set of variables which define some maps. Each variable is a vim list
" with vim list entries of the form:
" [ 'imap_cmd', 'imap_cmd_opt', 'leader', 'key', 'imap_rhs', 'test_variable', " 'help_msg' ]
" test_variable is a name  of a variable (which should be also defined) to
" test if this map is supposed to be defined or not, 'help_msg' should be just
" simplified 'imap_rhs' which can be echoed.

" Be 'cpoptions' (vi) compatible:
" Do not delete these, they are used below.
if &l:cpoptions =~# "B"
    let s:backslash="\\"
    let s:bbackslash="\\\\"
else
    let s:backslash="\\\\"
    let s:bbackslash="\\\\\\\\"
endif

"{{{ g:atp_imap_fonts
" let g:atp_imap_fonts = [
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'rm', 
" 	\ '<Esc>:call Insert("'.s:bbackslash.'textrm{}", "'.s:bbackslash.'mathrm{}", 1)<CR>i', "g:atp_imap_define_fonts", 'rm font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'up', 
" 	\ s:backslash.'textup{}<Left>', "g:atp_imap_define_fonts", 'up font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'md', 
" 	\ s:backslash.'textmd{}<Left>', "g:atp_imap_define_fonts", 'md font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'it', 
" 	\ '<Esc>:call Insert("'.s:bbackslash.'textit{}", "'.s:bbackslash.'mathit{}", 1)<CR>i', "g:atp_imap_define_fonts", 'it font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'sl', 
" 	\ s:backslash.'textsl{}<Left>', "g:atp_imap_define_fonts", 'sl font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'sc', 
" 	\ s:backslash.'textsc{}<Left>', "g:atp_imap_define_fonts", 'sc font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'sf', 
" 	\ '<Esc>:call Insert("'.s:bbackslash.'textsf{}", "'.s:bbackslash.'mathsf{}", 1)<CR>i', "g:atp_imap_define_fonts", 'sf font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'bf', 
" 	\ '<Esc>:call Insert("'.s:bbackslash.'textbf{}", "'.s:bbackslash.'mathbf{}", 1)<CR>i', "g:atp_imap_define_fonts", 'bf font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'tt', 
" 	\ '<Esc>:call Insert("'.s:bbackslash.'texttt{}", "'.s:bbackslash.'mathtt{}", 1)<CR>i', "g:atp_imap_define_fonts", 'tt font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'em', 
" 	\ s:backslash.'emph{}<Left>', "g:atp_imap_define_fonts", 'emphasize font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'no', 
" 	\ '<Esc>:call Insert("'.s:bbackslash.'textnormal{}", "'.s:bbackslash.'mathnormal{}", 1)<Cr>i', "g:atp_imap_define_fonts", 'normal font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'bb', 
" 	\ s:backslash.'mathbb{}<Left>', "g:atp_imap_define_fonts", 'mathbb font'],
"     \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_second_leader, 'cal', 
" 	\ s:backslash.'mathcal{}<Left>', "g:atp_imap_define_fonts", 'mathcal font'],
" \ ]
"}}}
" {{{ g:atp_imap_greek_letters
"     let g:atp_imap_greek_letters= [
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'a', s:backslash.'alpha',	 
" 		    \ "g:atp_imap_define_greek_letters", '\alpha' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'b', s:backslash.'beta',	 
" 		    \ "g:atp_imap_define_greek_letters", '\beta' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'c', s:backslash.'chi',	 
" 		    \ "g:atp_imap_define_greek_letters", '\chi' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'd', s:backslash.'delta',	 
" 		    \ "g:atp_imap_define_greek_letters", '\delta' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'e', s:backslash.'epsilon',	 
" 		    \ "g:atp_imap_define_greek_letters", '\epsilon' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'v', s:backslash.'varepsilon', 
" 		    \ "g:atp_imap_define_greek_letters", '\varepsilon' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'f', s:backslash.'phi',	 
" 		    \ "g:atp_imap_define_greek_letters", '\phi' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'y', s:backslash.'psi',	 
" 		    \ "g:atp_imap_define_greek_letters", '\psi' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'g', s:backslash.'gamma',	 
" 		    \ "g:atp_imap_define_greek_letters", '\gamma' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'h', s:backslash.'eta',	 
" 		    \ "g:atp_imap_define_greek_letters", '\eta' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'k', s:backslash.'kappa',	 
" 		    \ "g:atp_imap_define_greek_letters", '\kappa' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'l', s:backslash.'lambda',	 
" 		    \ "g:atp_imap_define_greek_letters", '\lambda' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'i', s:backslash.'iota',	 
" 		    \ "g:atp_imap_define_greek_letters", '\iota' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'm', s:backslash.'mu',	 
" 		    \ "g:atp_imap_define_greek_letters", '\mu' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'n', s:backslash.'nu',	 
" 		    \ "g:atp_imap_define_greek_letters", '\nu' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'p', s:backslash.'pi',	 
" 		    \ "g:atp_imap_define_greek_letters", '\pi' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'o', s:backslash.'theta',	 
" 		    \ "g:atp_imap_define_greek_letters", '\theta' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'r', s:backslash.'rho',	 
" 		    \ "g:atp_imap_define_greek_letters", '\rho' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 's', s:backslash.'sigma',	 
" 		    \ "g:atp_imap_define_greek_letters", '\sigma' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 't', s:backslash.'tau',	 
" 		    \ "g:atp_imap_define_greek_letters", '\tau' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'u', s:backslash.'upsilon',	 
" 		    \ "g:atp_imap_define_greek_letters", '\upsilon' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'v', s:backslash.'varsigma',	 
" 		    \ "g:atp_imap_define_greek_letters", '\varsigma' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'v', s:backslash.'vartheta',	 
" 		    \ "g:atp_imap_define_greek_letters", '\vartheta' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'w', s:backslash.'omega',	 
" 		    \ "g:atp_imap_define_greek_letters", '\omega' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'x', s:backslash.'xi',	 
" 		    \ "g:atp_imap_define_greek_letters", '\xi' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'z', s:backslash.'zeta',	 
" 		    \ "g:atp_imap_define_greek_letters", '\zeta' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'D', s:backslash.'Delta',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Delta' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'Y', s:backslash.'Psi',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Psi' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'F', s:backslash.'Phi',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Phi' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'G', s:backslash.'Gamma',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Gamma' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'L', s:backslash.'Lambda',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Lambda' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'M', s:backslash.'Mu',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Mu' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'P', s:backslash.'Pi',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Pi' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'O', s:backslash.'Theta',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Theta' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'S', s:backslash.'Sigma',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Sigma' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'T', s:backslash.'Tau',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Tau' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'U', s:backslash.'Upsilon',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Upsilon' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'W', s:backslash.'Omega',	 
" 		    \ "g:atp_imap_define_greek_letters", '\Omega' ],
" 	    \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'Z', s:backslash.'mathrm',	 
" 		    \ "g:atp_imap_define_greek_letters", '\mathrm' ],
" 	    \ ]
" }}}
" {{{ g:atp_imap_math_misc
" let g:atp_imap_math_misc = [
" \ [ 'inoremap', '<silent> <buffer>', g:atp_infty_leader,      '8', s:backslash.'infty', 	
" 	\ "g:atp_imap_define_math_misc", '\infty' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_infty_leader,      '6', s:backslash.'partial',	
" 	\ "g:atp_imap_define_math_misc", '\partial' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, '&', s:backslash.'wedge', 	
" 	\ "g:atp_imap_define_math_misc", '\wedge' ], 
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 've', s:backslash.'vee', 	
" 	\ "g:atp_imap_define_math_misc", '\vee' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'V', s:backslash.'Vee', 	
" 	\ "g:atp_imap_define_math_misc", '\Vee' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, '+', s:backslash.'bigcup', 	
" 	\ "g:atp_imap_define_math_misc", '\bigcup' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, '*', s:backslash.'bigcap', 	
" 	\ "g:atp_imap_define_math_misc", '\bigcap' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, s:backslash, s:backslash.'s:backslash', 
" 	\ "g:atp_imap_define_math_misc", '\s:backslash' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, 'N', s:backslash.'Nabla', 	
" 	\ "g:atp_imap_define_math_misc", '\Nabla' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, '@', s:backslash.'circ', 	
" 	\ "g:atp_imap_define_math_misc", '\circ' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, '=', s:backslash.'equiv', 	
" 	\ "g:atp_imap_define_math_misc", '\equiv' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, '>', s:backslash.'geq', 	
" 	\ "g:atp_imap_define_math_misc", '\geq' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, '<', s:backslash.'leq', 	
" 	\ "g:atp_imap_define_math_misc", '\leq' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, '.', s:backslash.'dot', 	
" 	\ "g:atp_imap_define_math_misc", '\dot' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_first_leader, '/', s:backslash.'frac{}{}<Esc>F}i', 	
" 	\ "g:atp_imap_define_math_misc", '\frac{}{}' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_over_leader,  '`', s:backslash.'grave{}<Left>', 	
" 	\ "g:atp_imap_define_math_misc", '\grave{}' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_over_leader,  'v', s:backslash.'check{}<Left>', 	
" 	\ "g:atp_imap_define_math_misc", '\check{}' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_over_leader,  '''', s:backslash.'acute{}<Left>', 	
" 	\ "g:atp_imap_define_math_misc", '\acute{}' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_over_leader,  '.', s:backslash.'dot{}<Left>', 	
" 	\ "g:atp_imap_define_math_misc", '\dot{}' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_over_leader,  '>', s:backslash.'vec{}<Left>', 	
" 	\ "g:atp_imap_define_math_misc", '\vec{}' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_over_leader,  '_', s:backslash.'bar{}<Left>', 	
" 	\ "g:atp_imap_define_math_misc", '\bar{}' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_over_leader,  '~', s:backslash.'=(g:atp_imap_wide ? "wide" : "")<CR>tilde{}<Left>', 	
" 	\ "g:atp_imap_define_math_misc", '''\''.(g:atp_imap_wide ? "wide" : "")."tilde"' ],
" \ [ 'inoremap', '<silent> <buffer>', g:atp_imap_over_leader,  '^', s:backslash.'=(g:atp_imap_wide ? "wide" : "" )<CR>hat{}<Left>', 	
" 	\ "g:atp_imap_define_math_misc", '''\''.(g:atp_imap_wide ? "wide" : "")."hat"' ], 
" \ ]
" }}}
" {{{ g:atp_imap_environments
"     let g:atp_imap_environments = [
" 	\ [ "inoremap", "<buffer> <silent>", 	g:atp_imap_third_leader, "m", 				s:backslash.'('.s:backslash.')<Left><Left>', 						"g:atp_imap_define_environments", 'inlince math' ],
" 	\ [ "inoremap", "<buffer> <silent>", 	g:atp_imap_third_leader, "M", 				s:backslash.'['.s:backslash.']<Left><Left>', 						"g:atp_imap_define_environments", 'displayed math' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_begin, 		s:backslash.'begin{}<Left>', 						"g:atp_imap_define_environments", '\begin{}' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_end, 		s:backslash.'end{}<Left>', 						"g:atp_imap_define_environments", '\end{}' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_proof, 		s:backslash.'begin{proof}<CR>'.s:backslash.'end{proof}<Esc>O', 				"g:atp_imap_define_environments", 'proof' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_center, 		s:backslash.'begin{center}<CR>\end{center}<Esc>O', 			"g:atp_imap_define_environments", 'center' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_flushleft, 		s:backslash.'begin{flushleft}<CR>'.s:backslash.'end{flushleft}<Esc>O', 			"g:atp_imap_define_environments", 'flushleft' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_flushright, 	s:backslash.'begin{flushright}<CR>'.s:backslash.'end{flushright}<Esc>O', 		"g:atp_imap_define_environments", 'flushright' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_bibliography, 	s:backslash.'begin{thebibliography}<CR>'.s:backslash.'end{thebibliography}<Esc>O', 	"g:atp_imap_define_environments", 'bibliography' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_abstract, 		s:backslash.'begin{abstract}<CR>'.s:backslash.'end{abstract}<Esc>O', 			"g:atp_imap_define_environments", 'abstract' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_item, 		'<Esc>:call InsertItem()<CR>a', 				"g:atp_imap_define_environments", 'item' 	],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_frame, 		s:backslash.'begin{frame}<CR>'.s:backslash.'end{frame}<Esc>O', 				"g:atp_imap_define_environments", 'frame' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_enumerate, 		s:backslash.'begin{enumerate}'.g:atp_EnvOptions_enumerate.'<CR>'.s:backslash.'end{enumerate}<Esc>O'.s:backslash.'item', 	"g:atp_imap_define_environments", 'enumerate' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_itemize, 		s:backslash.'begin{itemize}'.g:atp_EnvOptions_itemize.'<CR>'.s:backslash.'end{itemize}<Esc>O'.s:backslash.'item', 		"g:atp_imap_define_environments", 'itemize' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_tikzpicture, 	s:backslash.'begin{center}<CR>'.s:backslash.'begin{tikzpicture}<CR>'.s:backslash.'end{tikzpicture}<CR>'.s:backslash.'end{center}<Up><Esc>O', "g:atp_imap_define_environments", 'tikzpicture' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_theorem, 		s:backslash.'begin{=g:atp_EnvNameTheorem<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<CR>'.s:backslash.'end{=g:atp_EnvNameTheorem<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<Esc>O',  	"g:atp_imap_define_environments", 'theorem'],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_definition, 	s:backslash.'begin{=g:atp_EnvNameDefinition<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<CR>'.s:backslash.'end{=g:atp_EnvNameDefinition<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<Esc>O', 	"g:atp_imap_define_environments", 'definition'],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_proposition, 	s:backslash.'begin{=g:atp_EnvNameProposition<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<CR>'.s:backslash.'end{=g:atp_EnvNameProposition<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<Esc>O', 	"g:atp_imap_define_environments", 'proposition' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_lemma, 		s:backslash.'begin{=g:atp_EnvNameLemma<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<CR>'.s:backslash.'end{=g:atp_EnvNameLemma<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<Esc>O', 		"g:atp_imap_define_environments", 'lemma' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_remark, 		s:backslash.'begin{=g:atp_EnvNameRemark<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<CR>'.s:backslash.'end{=g:atp_EnvNameRemark<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<Esc>O', 		"g:atp_imap_define_environments", 'remark' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_note, 		s:backslash.'begin{=g:atp_EnvNameNote<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<CR>'.s:backslash.'end{=g:atp_EnvNameNote<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<Esc>O', 		"g:atp_imap_define_environments", 'note' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_example, 		s:backslash.'begin{example=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<CR>'.s:backslash.'end{example=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<Esc>O', 		"g:atp_imap_define_environments", 'example' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_corollary, 		s:backslash.'begin{=g:atp_EnvNameCorollary<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<CR>'.s:backslash.'end{=g:atp_EnvNameCorollary<CR>=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<Esc>O', 	"g:atp_imap_define_environments", 'corollary' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_align, 		s:backslash.'begin{align=(getline(".")[col(".")-2]=="*"?"":b:atp_StarMathEnvDefault)<CR>}<CR>'.s:backslash.'end{align=(getline(".")[col(".")-2]=="*"?"":b:atp_StarMathEnvDefault)<CR>}<Esc>O', 	"g:atp_imap_define_environments", 'align' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_equation, 		s:backslash.'begin{equation=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<CR>'.s:backslash.'end{equation=(getline(".")[col(".")-2]=="*"?"":b:atp_StarEnvDefault)<CR>}<Esc>O', 	"g:atp_imap_define_environments", 'equation' ],
" 	\ [ 'inoremap', '<silent> <buffer>',	g:atp_imap_third_leader, g:atp_imap_letter, 		s:backslash.'begin{letter}{}<CR>'.s:backslash.'opening{=g:atp_letter_opening<CR>}<CR>'.s:backslash.'closing{=g:atp_letter_closing<CR>}<CR>'.s:backslash.'end{letter}<Esc>?'.s:bbackslash.'begin{letter}{'.s:backslash.'zs<CR>i', 				"g:atp_imap_define_environments", 'letter' ],
" 	\ ]
" }}}
" {{{ g:atp_imap_math
"     let g:atp_imap_math= [ 
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", g:atp_imap_subscript, "( g:atp_imap_subscript == '_' && !atplib#IsLeft('\\', 1) && atplib#IsLeft('_') <bar><bar> g:atp_imap_subscript != '_' ) && atplib#IsInMath() ? (g:atp_imap_subscript == '_' ? '<BS>' : '' ).'_{}<Left>' : '_' ", "g:atp_imap_define_math", 	'_{}'], 
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", g:atp_imap_supscript, "( g:atp_imap_supscript == '^' && !atplib#IsLeft('\\', 1) && atplib#IsLeft('^') <bar><bar> g:atp_imap_supscript != '^' ) && atplib#IsInMath() ? (g:atp_imap_supscript == '^' ? '<BS>' : '' ).'^{}<Left>' : (atplib#IsLeft('~') ? '<BS>".s:backslash."=(g:atp_imap_wide ? ''wide'' : '''' )<CR>hat{}<Left>' : '^') ", "g:atp_imap_define_math", 	'^{}'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "~", "atplib#IsLeft('~') && atplib#IsInMath() ? '<BS>".s:backslash."=(g:atp_imap_wide ? \"wide\" : \"\" ) <CR>tilde{}<Left>' : '~' " , "g:atp_imap_define_math", 	'^{}'], 
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "=", "atplib#IsInMath() && atplib#IsLeft('=') && !atplib#IsLeft('&',1) ? '<BS>&=' : '='", "g:atp_imap_define_math",	'&=' ],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "o+", "atplib#IsInMath() ? '".s:backslash."oplus' 	: 'o+' ", "g:atp_imap_define_math", 		'\\oplus' ],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "O+", "atplib#IsInMath() ? '".s:backslash."bigoplus' 	: 'O+' ", "g:atp_imap_define_math",		'\\bigoplus'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "o-", "atplib#IsInMath() ? '".s:backslash."ominus' 	: 'o-' ", "g:atp_imap_define_math",		'\\ominus'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "o.", "atplib#IsInMath() ? '".s:backslash."odot' 	: 'o.' ", "g:atp_imap_define_math",			'\\odot'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "O.", "atplib#IsInMath() ? '".s:backslash."bigodot' 	: 'O.' ", "g:atp_imap_define_math",		'\\bigodot'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "o*", "atplib#IsInMath() ? '".s:backslash."otimes' 	: 'o*' ", "g:atp_imap_define_math",		'\\otimes'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "O*", "atplib#IsInMath() ? '".s:backslash."bigotimes' 	: 'O*' ", "g:atp_imap_define_math",		'\\bigotimes'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "s+", "atplib#IsInMath() ? '".s:backslash."cup' 	: 's+' ", "g:atp_imap_define_math",			'\\cup'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "s-", "atplib#IsInMath() ? '".s:backslash."setminus' 	: 's-' ", "g:atp_imap_define_math",		'\\cup'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "S+", "atplib#IsInMath() ? '".s:backslash."bigcup' 	: 'S+' ", "g:atp_imap_define_math",		'\\bigcup'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "s*", "atplib#IsInMath() ? '".s:backslash."cap' 	: 's*' ", "g:atp_imap_define_math",			'\\cap'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "S*", "atplib#IsInMath() ? '".s:backslash."bigcap' 	: 'S*' ", "g:atp_imap_define_math",		'\\bigcap'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "c*", "atplib#IsInMath() ? '".s:backslash."prod' 	: 'c*' ", "g:atp_imap_define_math",			'\\prod'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "c+", "atplib#IsInMath() ? '".s:backslash."coprod' 	: 'c+' ", "g:atp_imap_define_math",		'\\coprod'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "t<", "atplib#IsInMath() ? '".s:backslash."triangleleft' : 't<' ", "g:atp_imap_define_math",		'\\triangleleft'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "t>", "atplib#IsInMath() ? '".s:backslash."triangleright' : 't>' ", "g:atp_imap_define_math",		'\\triangleright'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "s<", "atplib#IsInMath() ? '".s:backslash."subseteq' 	: 's<' ", "g:atp_imap_define_math",		'\\subseteq'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "s>", "atplib#IsInMath() ? '".s:backslash."supseteq' 	: 's>' ", "g:atp_imap_define_math",		'\\supseteq'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", "<=", "atplib#IsInMath() ? '".s:backslash."leq' 	: '<=' ", "g:atp_imap_define_math",			'\\leq'],
" 	\ [ "inoremap", "<buffer> <silent> <expr>", "", ">=", "atplib#IsInMath() ? '".s:backslash."geq' 	: '>=' ", "g:atp_imap_define_math",			'\\geq'],
" 	\ ]
" }}}
" }}}
" }}}

" VMAPS:
" {{{ VMAPS 
" This is non default setting, the default is to use <LocalLeader>:
    let g:atp_vmap_text_font_leader		= "_"

"     let g:atp_vmap_math_font_leader		= "\\"
"     let g:atp_vmap_bracket_leader		= "\\"
"     let g:atp_vmap_big_bracket_leader		= "\\b"


" Disable some keys:
vnoremap <buffer> _  	<Nop>
vnoremap <buffer> _b 	<Nop>
" _ has a vim meaning which interfers, I switch this off
vmap <buffer> _m	<Nop>
vmap <buffer> _M	<Nop>
" }}}

" ABBREVIATIONS:
" If you don't want to use abbreviation set this variable to 1 (the default is 0):
"     let g:atp_no_abbreviations 	= 0
" Loading abbreviation takes time if your project file (.project.vim) doesn't
" contain b:atp_LocalEnvironments variable, because it runs :LocalCommands.
"
" If you don't use project file, and you but you still wan't abbreviations,
" and you don't mind to not have abbreviations for locally defined
" environments you can set the following variable to 1 (by default it is not
" set):
"     let g:atp_no_local_abbreviations	= 0

" Completion:
" Completion {{{
" This variable defines completion modes which are used by ATP
" It is read only variable.
" let g:atp_completion_modes=[ 
" 	    \ 'commands', 		'labels', 		
" 	    \ 'tikz libraries', 	'environment names',
" 	    \ 'close environments' , 	'brackets',
" 	    \ 'input files',		'bibstyles',
" 	    \ 'bibitems', 		'bibfiles',
" 	    \ 'documentclass',		'tikzpicture commands',
" 	    \ 'tikzpicture',		'tikzpicture keywords',
" 	    \ 'package names',		'font encoding',
" 	    \ 'font family',		'font series',
" 	    \ 'font shape',		'algorithmic',
" 	    \ 'beamerthemes', 		'beamerinnerthemes',
" 	    \ 'beamerouterthemes', 	'beamercolorthemes',
" 	    \ 'beamerfontthemes',	'todonotes' 
" 	    \ 'siunits' ]
"
" By default Tab Completion uses all defined modes
" 	g:atp_completion_active_modes = copy(g:atp_completion_modes)
" if you want to remove one of them you can use
" 	call remove(g:atp_completion_active_modes, 'siuinits')
" But first you have to uncomment the above definition of
" g:atp_completion_modes.
"
" This variable defines bracket which will be used for closing, you can remove
" some from the default value to speed up tab completion (this is what I did
" below: there is no <:> and \lgroup:\rgroup.
    let g:atp_bracket_dict = { '(' : ')', '{' : '}', '[' : ']', '\lceil' : '\rceil', '\lfloor' : '\rfloor', '\langle' : '\rangle' }

" The path to compile.py script: (this setting is compatible with pathogen plugin:
"     let g:atp_PythonCompilerPath=split(globpath(&rtp, '**/ATP_files/compile.py'), "\n")[0]

" Copy command used by bash compiler:
    let g:atp_cpcmd = "/bin/cp "
" }}}

" Additional Maps:
" {{{
" dd map to delete section inside Table of Contents, it is not provided by
" default.
au FileType toc_atp		nnoremap <buffer> dd :DeleteSection<CR>


" Use ATP/LatexBox indentation set this to 1 (the default)
"     let g:atp_indentation		= 1
"     let g:tex_indent_items 		= 1
"     let g:atp_statusline		= 1
" List of environments which might be long so search longer parts of text of
" its end:
"     let g:atp_EnvOptions_enumerate	= "[topsep=0pt,noitemsep]"
"     let g:atp_letter_opening		= "Dir Sir,"
"     let g:atp_letter_closing		= "Best regards,"
"     let g:atp_long_environments	= ['tikzpicture', 'center', 'figure']
"     let g:atp_LatexBox		= 1
" }}}

" Status Line:
" If you don't want to have output directory in your status line set this to 0 (the
" default is 1):
    let g:atp_statusOutDir 	= 0
" Notification:
" {{{
" Use status notification (the default is 1 - use it, 0 - to switch it off):
"     let g:atp_statusNotifi		= 1
" This variable sets the highlight group used for some messages in status line
" (currently only for highlightinig that LaTeX is running). The value is from
" 0-9. When set to 0 (the default) disables highlighting N sets UserN
" highlight group (see :help hl-User1..9).
    let g:atp_statusNotifHi		= 6


" If set to 1 messages in QuickFix list will be highlighted after each
" compelation. By default this feature is turned off.
" 	let g:atp_HightlighErrors 		= 0
" Only two groups are supported. The first is for errors, while the second for
" all other QuickFix messages. If you set "" the corresponing messages will
" not be highlighted. By default only error messages are highlighted.
" 	let g:atp_Highlight_ErrorGroup 		= "Error"
" 	let g:atp_Highlight_WarningGroup 	= ""

" Some nice settings for highlight the status notification:
" each variable is of the form: g:atp_notification_{colorname}_{highlight_cmd}
" where {colorname} is a name of color file, and {highlight_cmd} is: gui,
" guifg, guibg, cterm, ctermfg, ctermbg.
    let g:atp_notification_coots_beauty_256_guifg 	= "#8b0a50"
    let g:atp_notification_molokai_guifg		= "red"
    let g:atp_notification_moria_guifg			= "red"
    let g:atp_notification_pyte_guifg			= "red"
    let g:atp_notification_mayansmoke_gui		= "bold"
    let g:atp_notification_mayansmoke_guifg		= "red"
    let g:atp_notification_bclear_gui			= "bold"
    let g:atp_notification_guepardo_gui			= "bold"
    let g:atp_notification_guepardo_guifg		= "red"
    let g:atp_notification_rastafari_dark_ctermfg	= 1
    let g:atp_notification_rastafari_dark_cterm		= "bold"
    let g:atp_notification_coots_beauty_256_ctermfg	= 1
    let g:atp_notification_coots_beauty_256_cterm	= "bold"
" }}}

" Table Of Contents:
" {{{
" If set to 1 the current section in Table of Contents will be updated (using
" CursorHold autocommand)
"     let g:atp_UpdateToCLine		= 1
" }}}

" Various:
" {{{
" This is a list of extensions which will be deleted with :Delete!. You do not
" need to add 'pdf', or 'dvi'.
"     g:atp_DeleteWithBang			= [ 'synctex.gz', 'tex.project.vim' ]
"     let g:no_LatexBox				= 1
"     let g:atp_check_if_LatexBox		= 1
"     let g:atp_generate_local_labels_on_startup = 0
"     let g:atp_ssh				= "mszamo@ssh.math.ist.utl.pt"
"     let b:atp_local_completion_lists		= 2
"     let g:printingoptions			= "-o sides=two-sided-long-edge -o number-up=2 " 
"
" g:vertical = 0 should be the default!
    let g:vertical				= 0
"     let g:askfortheoutdir			= 0

" If you set this variable to 1 :TexAlign will join lines which doesn't end
" with \\ (default value is 0) .
let g:atp_TexAlign_join_lines			= 1
" }}}

" LaTeX Settings:
" {{{
"     let g:tex_flavor="tex"
"
" The value should be your local texmf tree
" the default value is $HOME/texmf which is the default value in TeXLive
    let g:texmf				= "/home/texmf"
"
" This variable stores list of  LaTeX packages. It is automattically generated
" when needed. If you install new LaTeX packages, and you want ATP to know
" about them just unlet it (unlet g:atp_LatexPackages)
"     g:atp_LatexPackages
" As above but stores LaTeX document classes.
"     g:atp_LatexClasses

" }}}

" DEBUG VARIABLES: {{{1

" This variable enbles :DebugPrint command which echoes the ATP debug files
" stored in g:atp_Temp directory.
let g:atp_atpdev		= 1

" debug atplib#CheckClosed_math() function.
let g:atp_debugCheckClosed_math	= 1

" debug mappings.vim file (show which maps will not be defined)
let g:atp_debugMapFile		= 1

" debug :Tags (:LatexTags commands)
let g:atp_debugLatexTags	= 1

let g:atp_debugTC		= 0

let g:atp_debugInsertItem	= 0

" debug <SID>auTeX() function (compiler.vim)
let g:atp_debugauTeX		= 0

" BibSearch() in ATP_files/search.vim
let g:atp_debugBS 		= 1

" TreeOfFiles() ATP_files/common.vim
let g:atp_debugToF 		= 1

" echo msg if babel language is not supported.
let g:atp_debugBabel 		= 1

" debug :UpdateATP command:
let g:atp_debugUpdateATP 	= 1

" debug MakeLatex (compiler.vim)
let g:atp_debugML		= 1

" debug aptlib#GrepAuxFile
let g:atp_debugGAF		= 1

" debug s:SelectCurrentParapgrahp (LatexBox_motion.vim)
let g:atp_debugSelectCurrentParagraph	= 1

" debug <SID>RecursiveSearch (search.vim)
let g:atp_debugRS		= 0

" debug <SID>SearchInTree (search.vim)
let g:atp_debugSIT		= 0

" debug forward search (vim->viewer) (search.vim)
let g:atp_debugSync		= 1

" debug SyncTex (compiler.vim)
let g:atp_debugSyncTex		= 0

" debug InsertItem
let g:atp_debugInserItem	= 0

" debug ViewOutput() (compiler.vim)
let g:atp_debugV		= 1

" Debug s:LoadProjectFile() (history.vim)
" (currently it gives just the loading time info)
let g:atp_debugLPS		= 0

" Debug s:Compiler() function (compiler.vim)
" when equal 2 output is more verbose.
let g:atp_debugCompiler 	= 1

" debug s:PythonCompiler() (compiler.vim)
let g:atp_debugPythonCompiler	= 1

" Debug <SID>CallBack() function (compiler.vim)
let g:atp_debugCallBack		= 1

" Debug SyncTex() (various.vim) function
let g:atp_debugST 		= 1

" Debug atplib#CloseLastEnvironment()
let g:atp_debugCloseLastEnvironment 		= 1

" loading times of scripts sources by main script file: ftpluing/tex_atp.vim
" NOTE: it is listed here for completeness, it can only be set in
" ftplugin/tex_atp.vim script file.
let g:atp_debugMainScript 	= 1

" <SID>LoadScript(), <SID>LoadProjectScript(), <SID>WriteProject()
" The value that is set in history file matters!
let g:atp_debugProject 		= 0

" atplib#CheckBracket()
let g:atp_debugCheckBracket 	= 1

" atplib#CloseLastBracket()
let g:atp_debugCloseLastBracket = 1

" atplib#TabCompletion()
let g:atp_debugTabCompletion 	= 1
" ATP INTERNAL OPTIONS: {{{1
"     This vairable is used by TOC (Table of Contents). It is dictionary with
"     with entries: section_name : [ 'pattern', 'pattern*' ] , pattern should
"     match where secion_name begins, pattern* is a pattern to check if the section is starred.
"     let g:atp_sections={
" 	\	'chapter' 	: [ '\m^\s*\(\\chapter\*\?\>\)',			'\m\\chapter\*'		],	
" 	\	'section' 	: [ '\m^\s*\(\\section\*\?\>\)',			'\m\\section\*'		],
" 	\ 	'subsection' 	: [ '\m^\s*\(\\subsection\*\?\>\)',			'\m\\subsection\*'	],
" 	\	'subsubsection' : [ '\m^\s*\(\\subsubsection\*\?\>\)',			'\m\\subsubsection\*'	],
" 	\	'bibliography' 	: [ '\m^\s*\(\\begin\s*{\s*thebibliography\s*}\|\\bibliography\s*{\)' , 'nopattern'],
" 	\	'abstract' 	: [ '\m^\s*\(\\begin\s*{abstract}\|\\abstract\s*{\)',	'nopattern'		],
" 	\   	'part'		: [ '\m^\s*\(\\part\*\?\>\)',				'\m\\part\*'		]
" 	\ }
"
" 1}}}

let g:source_times = [ 
	    \ "g:source_time",
	    \ "g:source_time_LatexBox",
	    \ "g:source_time_options",
	    \ "g:source_time_OPTIONS",
	    \ "g:source_time_INPUTS",
	    \ "g:source_time_TREE",
	    \ "g:source_time_abbrev",
	    \ "g:source_time_atprc_begin",
	    \ "g:source_time_atprc_end",
	    \ "g:source_time_compiler",
	    \ "g:source_time_maps",
	    \ "g:source_time_menu",
	    \ "g:source_time_motion",
	    \ "g:source_time_project",
	    \ "g:source_time_package_files",
	    \ ]
