"---------------"
" Light Version "
"---------------"
" base colors:
" Darker Blue:     27 #0087ff
" Lighter Blue:    39 #00afff
" Orange:         202 #ffaf5f
" Yellow:         178 #ffd75f
" Green:          35 #87d75f
" Light Red:      203 #ff5f5f
" Dark Red:       196 #ff0000
" White:          255 #ffffff
" Light Gray:     244 #c6c6c6
" Dark Gray:      240 #8a8a8a
"
" UI ONLY
" Backround Gray:     234 #1c1c1c
" Lighter Background: 235 #262626

hi Normal       ctermbg=255  ctermfg=0    cterm=NONE      guibg=#ffffff guifg=#000000 gui=NONE
hi Underlined   ctermbg=NONE ctermfg=NONE cterm=underline guibg=NONE    guifg=NONE    gui=underline
hi Error        ctermbg=196  ctermfg=255  cterm=NONE      guibg=#ff0000 guifg=#ffffff gui=NONE
hi Todo         ctermbg=NONE ctermfg=202  cterm=NONE      guibg=#000000 guifg=#ffaf5f gui=NONE
hi Number       ctermbg=NONE ctermfg=35  cterm=NONE      guibg=NONE    guifg=#87d75f gui=NONE
hi String       ctermbg=NONE ctermfg=203  cterm=NONE      guibg=NONE    guifg=#ff5f5f gui=NONE
hi Special      ctermbg=NONE ctermfg=178  cterm=italic    guibg=NONE    guifg=#ffd787 gui=italic
hi Function     ctermbg=NONE ctermfg=202  cterm=NONE      guibg=NONE    guifg=#ffaf5f gui=NONE
hi SpecialKey   ctermbg=NONE ctermfg=196  cterm=NONE      guibg=NONE    guifg=#ff0000 gui=NONE
hi MatchParen   ctermbg=NONE ctermfg=203  cterm=bold      guibg=NONE    guifg=#ff5f5f gui=bold
hi Comment      ctermbg=NONE ctermfg=240  cterm=NONE      guibg=NONE    guifg=#8a8a8a gui=NONE
hi Constant     ctermbg=NONE ctermfg=35  cterm=NONE      guibg=NONE    guifg=#87d75f gui=NONE
hi Keyword      ctermbg=NONE ctermfg=255  cterm=NONE      guibg=NONE    guifg=#ffffff gui=NONE
hi Identifier   ctermbg=NONE ctermfg=244  cterm=NONE      guibg=NONE    guifg=#c6c6c6 gui=NONE
hi Statement    ctermbg=NONE ctermfg=27   cterm=NONE      guibg=NONE    guifg=#5fafd7 gui=NONE
hi PreProc      ctermbg=NONE ctermfg=202  cterm=NONE      guibg=NONE    guifg=#ffaf5f gui=NONE
hi Type         ctermbg=NONE ctermfg=39  cterm=Bold      guibg=NONE    guifg=#87afff gui=bold
hi Visual       ctermbg=236  ctermfg=NONE cterm=NONE      guifg=NONE    guifg=NONE    gui=NONE

"==============================================================================
" UI Elements
"==============================================================================

hi NonText      ctermbg=250  ctermfg=NONE cterm=NONE      guibg=#1c1c1c guifg=NONE    gui=NONE
hi LineNr       ctermbg=250  ctermfg=240  cterm=NONE      guibg=#1c1c1c guifg=#8a8a8a gui=NONE

" Menus
hi Pmenu        ctermbg=250  ctermfg=234  cterm=NONE      guibg=#1c1c1c guifg=#c6c6c6 gui=NONE
hi PmenuSel     ctermbg=39   ctermfg=0    cterm=NONE      guibg=#5fafd7 guifg=#000000 gui=NONE
hi PmenuSbar    ctermbg=253  ctermfg=253  cterm=NONE       gui=NONE
hi PmenuThumb   ctermbg=234  ctermfg=234  cterm=NONE      guibg=#8a8a8a guifg=#1c1c1c gui=NONE
hi WildMenu     ctermbg=250  ctermfg=255  cterm=NONE      guibg=#1c1c1c guifg=#ffffff gui=NONE

" Cursor
hi CursorColumn ctermbg=252  ctermfg=NONE cterm=NONE      guibg=#262626 guifg=NONE    gui=NONE
hi CursorLine   ctermbg=252  ctermfg=NONE cterm=NONE      guibg=#262626 guifg=NONE    gui=NONE
hi CursorLineNr ctermbg=0    ctermfg=NONE cterm=bold      guibg=#000000 guifg=NONE    gui=bold

" Column and line highlights
hi ColorColumn  ctermbg=234  ctermfg=NONE cterm=NONE      guibg=#1c1c1c guifg=NONE    gui=NONE
hi SignColumn   ctermbg=234  ctermfg=255  cterm=NONE      guibg=#1c1c1c guifg=#ffffff gui=NONE
hi StatusLine   ctermbg=234  ctermfg=39  cterm=bold      guibg=#1c1c1c guifg=#87afff gui=bold
hi StatusLineNC ctermbg=0    ctermfg=235  cterm=NONE      guibg=#000000 guifg=#262626 gui=NONE
hi VertSplit    ctermbg=234  ctermfg=240  cterm=NONE      guibg=#1c1c1c guifg=#8a8a8a gui=NONE

hi Directory    ctermbg=NONE ctermfg=27   cterm=NONE      guibg=NONE    guifg=#5fafd7 gui=NONE

" Messages
hi ErrorMsg     ctermbg=196  ctermfg=255  cterm=bold      guibg=#ff0000 guifg=#ffffff gui=bold
hi WarningMsg   ctermbg=NONE ctermfg=196  cterm=NONE      guibg=NONE    guifg=#ff0000 gui=NONE
hi MoreMsg      ctermbg=NONE ctermfg=27   cterm=bold      guibg=NONE    guifg=#5fafd7 gui=bold
hi ModeMsg      ctermbg=NONE ctermfg=fg   cterm=bold      guibg=NONE    guifg=fg      gui=bold
hi Question     ctermbg=NONE ctermfg=35  cterm=NONE      guibg=NONE    guifg=#87d75f gui=NONE
hi Title        ctermbg=NONE ctermfg=202  cterm=bold      guibg=NONE    guifg=#ffaf5f gui=bold

hi Search       ctermbg=202  ctermfg=235  cterm=NONE      guibg=#ffaf5f guifg=#262626 gui=NONE

" Tabs
hi TabLine      ctermbg=234  ctermfg=27   cterm=NONE      guibg=#1c1c1c guifg=#5fafd7 gui=NONE
hi TabLineSel   ctermbg=234  ctermfg=202  cterm=underline guibg=#1c1c1c guifg=#ffaf5f gui=underline
hi TabLineFill  ctermbg=234  ctermfg=244  cterm=NONE      guibg=#1c1c1c guifg=#c6c6c6 gui=NONE

hi Folded       ctermbg=234  ctermfg=244  cterm=underline guibg=#1c1c1c guifg=#c6c6c6 gui=underline

" Diff
hi DiffAdd      ctermbg=bg   ctermfg=35  cterm=NONE      guibg=bg      guifg=#87d75f gui=NONE
hi DiffChange   ctermbg=bg   ctermfg=178  cterm=NONE      guibg=bg      guifg=#ffd787 gui=NONE
hi DiffDelete   ctermbg=bg   ctermfg=203  cterm=bold      guibg=bg      guifg=#ff5f5f gui=bold
hi DiffText     ctermbg=bg   ctermfg=fg   cterm=NONE      guibg=bg      guifg=fg      gui=NONE

" Spellchecker
hi SpellBad     ctermbg=NONE ctermfg=196  cterm=undercurl guibg=NONE    guifg=#ff0000 gui=undercurl
hi SpellCap     ctermbg=NONE ctermfg=27   cterm=undercurl guibg=NONE    guifg=#5fafd7 gui=undercurl
hi SpellRare    ctermbg=NONE ctermfg=35  cterm=undercurl guibg=NONE    guifg=#87d75f gui=undercurl
hi SpellLocal   ctermbg=NONE ctermfg=35  cterm=undercurl guibg=NONE    guifg=#87d75f gui=undercurl
