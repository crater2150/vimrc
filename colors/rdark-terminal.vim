"
" rdark-terminal - vim color scheme
"
" Modified: Lukas Grässlin
" Modified: crater2150
"
" Based on rdark
" (http://www.vim.org/scripts/script.php?script_id=1732)
"
" Originally converted with CSApprox and modified a bit
" to fit a 256 color capable terminal.
" (http://www.vim.org/scripts/script.php?script_id=2390)
"
" Info: As the original background color is not available in 256 color mode
" I've set it to black. But you can set the color your terminal should display
" for black to #1e2426 and you will have almost a 1:1 copy of the gui scheme.
" I also suggest to set the second black color to #2c3032. (It is the
" background color which ist used for NonText)
" If you're using a terminal which reads from Xdefaults (e.g. urxvt) you just
" do this in your .Xdefaults:
" "*color0:                                                          rgb:1e/24/26"
" "*color8:                                                          rgb:2c/30/32"
"

hi clear
let colors_name="rdark-terminal"

hi clear CursorLine
hi CursorLine ctermbg=8

hi Normal              ctermbg=NONE ctermfg=252  cterm=NONE   term=NONE
hi Underlined          ctermbg=NONE ctermfg=111  cterm=underline term=underline
hi Ignore              ctermbg=NONE ctermfg=16   cterm=NONE   term=NONE
hi Error               ctermbg=160  ctermfg=255  cterm=NONE   term=reverse
hi Todo                ctermbg=16   ctermfg=215  cterm=NONE   term=NONE
hi Number              ctermbg=NONE ctermfg=113  cterm=NONE   term=NONE
hi String              ctermbg=NONE ctermfg=203  cterm=NONE   term=NONE
hi Symbol              ctermbg=NONE ctermfg=222  cterm=standout term=standout
hi Function            ctermbg=NONE ctermfg=215  cterm=NONE   term=NONE
hi SpecialKey          ctermbg=NONE ctermfg=196  cterm=NONE   term=bold
hi NonText             ctermbg=NONE ctermfg=236  cterm=NONE   term=bold
hi MatchParen          ctermbg=NONE ctermfg=160  cterm=NONE   term=reverse
hi Comment             ctermbg=NONE ctermfg=245  cterm=NONE   term=bold
hi Constant            ctermbg=NONE ctermfg=113  cterm=NONE   term=underline
hi Special             ctermbg=NONE ctermfg=248  cterm=NONE   term=bold
hi Keyword             ctermbg=NONE ctermfg=255  cterm=NONE   term=NONE
hi Identifier          ctermbg=NONE ctermfg=252  cterm=NONE   term=underline
hi Statement           ctermbg=NONE ctermfg=74   cterm=NONE   term=bold
hi PreProc             ctermbg=NONE ctermfg=215  cterm=NONE   term=underline
hi Type                ctermbg=NONE ctermfg=111  cterm=Bold   term=underline
hi LineNr              ctermbg=233  ctermfg=59   cterm=NONE   term=underline
hi ColorColumn         ctermbg=234  ctermfg=NONE cterm=NONE   term=underline
hi ExtraWhitespace     ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi Visual              ctermbg=236  ctermfg=255  cterm=NONE   term=reverse

hi Pmenu               ctermbg=16   ctermfg=250  cterm=NONE   term=NONE
hi PmenuSel            ctermbg=61   ctermfg=231  cterm=NONE   term=NONE
hi PmenuSbar           ctermbg=238  ctermfg=238  cterm=NONE   term=NONE
hi PmenuThumb          ctermbg=102  ctermfg=102  cterm=NONE   term=NONE


hi StatusLine          ctermbg=236  ctermfg=69   cterm=bold   term=reverse,bold
hi StatusLineNC        ctermbg=233  ctermfg=242  cterm=NONE   term=reverse
hi VertSplit           ctermbg=102  ctermfg=59   cterm=NONE   term=reverse
hi Directory           ctermbg=NONE ctermfg=231  cterm=NONE   term=bold
hi ErrorMsg            ctermbg=196  ctermfg=231  cterm=NONE   term=NONE
hi IncSearch           ctermbg=215  ctermfg=23   cterm=NONE   term=reverse
hi Search              ctermbg=215  ctermfg=23   cterm=NONE   term=reverse
hi MoreMsg             ctermbg=NONE ctermfg=74   cterm=bold   term=bold
hi ModeMsg             ctermbg=NONE ctermfg=fg   cterm=bold   term=bold
hi TabLine             ctermbg=16   ctermfg=102  cterm=underline term=underline
hi TabLineSel          ctermbg=59   ctermfg=255  cterm=NONE   term=bold
hi TabLineFill         ctermbg=16   ctermfg=16   cterm=NONE   term=reverse
hi CursorColumn        ctermbg=241  ctermfg=fg   cterm=NONE   term=reverse
hi Cursor              ctermbg=145  ctermfg=16   cterm=NONE   term=NONE
hi cppSTLType          ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi cssUIProp           ctermbg=NONE ctermfg=188  cterm=NONE   term=NONE
hi vimAutoEvent        ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi cParen              ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi cBracket            ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi cNumbers            ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi FoldeColumn         ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi Question            ctermbg=NONE ctermfg=113  cterm=NONE   term=NONE
hi Title               ctermbg=NONE ctermfg=215  cterm=bold   term=bold
hi VisualNOS           ctermbg=NONE ctermfg=fg   cterm=bold,underline term=bold,underline
hi WarningMsg          ctermbg=NONE ctermfg=196  cterm=NONE   term=NONE
hi WildMenu            ctermbg=233  ctermfg=255  cterm=NONE   term=NONE
hi Folded              ctermbg=234  ctermfg=188  cterm=underline term=NONE
hi javaScriptBraces    ctermbg=NONE ctermfg=102  cterm=NONE   term=NONE
hi javaScriptOperator  ctermbg=NONE ctermfg=102  cterm=NONE   term=NONE
hi htmlTag             ctermbg=NONE ctermfg=102  cterm=NONE   term=NONE
hi htmlTagName         ctermbg=NONE ctermfg=145  cterm=NONE   term=NONE
hi cCppBracket         ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi cBlock              ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi htmlTitle           ctermbg=NONE ctermfg=113  cterm=NONE   term=NONE
hi cUserCont           ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi lCursor             ctermbg=145  ctermfg=16   cterm=NONE   term=NONE
hi cssPseudoClassId    ctermbg=NONE ctermfg=255  cterm=NONE   term=NONE
hi cssBraces           ctermbg=NONE ctermfg=102  cterm=NONE   term=NONE
hi cssIdentifier       ctermbg=NONE ctermfg=215  cterm=NONE   term=NONE
hi cssTagName          ctermbg=NONE ctermfg=215  cterm=NONE   term=NONE
hi cMulti              ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi ICursor             ctermbg=145  ctermfg=fg   cterm=NONE   term=NONE
hi FoldColumn          ctermbg=16   ctermfg=61   cterm=NONE   term=NONE
hi DiffAdd             ctermbg=0    ctermfg=113  cterm=NONE   term=bold
hi DiffChange          ctermbg=0    ctermfg=fg   cterm=NONE   term=bold
hi DiffDelete          ctermbg=0    ctermfg=215  cterm=bold   term=bold
hi DiffText            ctermbg=0    ctermfg=fg   cterm=NONE   term=reverse
hi SignColumn          ctermbg=233  ctermfg=51   cterm=NONE   term=NONE
hi SignHidden          ctermbg=233  ctermfg=233  cterm=NONE   term=NONE
hi SpellBad            ctermbg=NONE ctermfg=196  cterm=undercurl term=reverse
hi SpellCap            ctermbg=NONE ctermfg=21   cterm=undercurl term=reverse
hi SpellRare           ctermbg=NONE ctermfg=201  cterm=undercurl term=reverse
hi SpellLocal          ctermbg=NONE ctermfg=51   cterm=undercurl term=underline
hi htmlSpecialTagName  ctermbg=NONE ctermfg=145  cterm=NONE   term=NONE
hi htmlArg             ctermbg=NONE ctermfg=188  cterm=NONE   term=NONE
hi cBitField           ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi cssSelectorOp       ctermbg=NONE ctermfg=255  cterm=NONE   term=NONE
hi pythonFunction      ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi cNumbersCom         ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi vimFuncName         ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi cCppParen           ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE
hi htmlEndTag          ctermbg=NONE ctermfg=102  cterm=NONE   term=NONE
hi vimFold             ctermbg=NONE ctermfg=fg   cterm=NONE   term=NONE


hi IndentGuidesOdd  ctermbg=0
hi IndentGuidesEven ctermbg=232

hi nearLineEnd         ctermbg=17   ctermfg=fg   cterm=NONE   term=NONE
hi atLineEnd           ctermbg=52   ctermfg=fg   cterm=NONE   term=NONE

hi User1               ctermbg=234  ctermfg=245  cterm=NONE   term=NONE
hi User2               ctermbg=237  ctermfg=33   cterm=bold   term=NONE

" Line background highlights
hi ErrorLine ctermbg=52
hi WarnLine ctermbg=233

hi Conceal ctermbg=NONE

" Ruby {{{
hi link rubySymbol Symbol

" }}}
