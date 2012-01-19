" Author:	Marcin Szamotulski
" Note:		This file is a part of Automatic Tex Plugin for Vim.
" Language:	tex
" Last Change:

let g:atp_maps = [['execute', 'nmap <buffer> ', 'g:atp_map_forward_motion_leader', 'i', ':NInput<CR>"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_backward_motion_leader', 'i', ':PInput<CR>"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_forward_motion_leader', 'gf', ':NInput<CR>"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_backward_motion_leader', 'gf', ':PInput<CR>"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_forward_motion_leader', 'S', '<Plug>GotoNextSubSection"'], 
	    \ ['execute', 'vmap <buffer> ', 'g:atp_map_forward_motion_leader', 'S', '<Plug>vGotoNextSubSection"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_backward_motion_leader', 'S', '<Plug>GotoPreviousSubSection"'], 
	    \ ['execute', 'vmap <buffer> ', 'g:atp_map_backward_motion_leader', 'S', '<Plug>vGotoPreviousSubSection"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_forward_motion_leader', 's', '<Plug>GotoNextSection"'], 
	    \ ['execute', 'vmap <buffer> ', 'g:atp_map_forward_motion_leader', 's', '<Plug>vGotoNextSection"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_backward_motion_leader', 's', '<Plug>GotoPreviousSection"'], 
	    \ ['execute', 'vmap <buffer> ', 'g:atp_map_backward_motion_leader', 's', '<Plug>vGotoPreviousSection"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_forward_motion_leader', 'c', '<Plug>GotoNextChapter"'], 
	    \ ['execute', 'vmap <buffer> ', 'g:atp_map_forward_motion_leader', 'c', '<Plug>vGotoNextChapter"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_backward_motion_leader', 'c', '<Plug>GotoPreviousChapter"'], 
	    \ ['execute', 'vmap <buffer> ', 'g:atp_map_backward_motion_leader', 'c', '<Plug>vGotoPreviousChapter"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_forward_motion_leader', 'p', '<Plug>GotoNextPart"'], 
	    \ ['execute', 'vmap <buffer> ', 'g:atp_map_forward_motion_leader', 'p', '<Plug>vGotoNextPart"'], 
	    \ ['execute', 'nmap <buffer> ', 'g:atp_map_backward_motion_leader', 'p', '<Plug>GotoPreviousPart"'], 
	    \ ['execute', 'vmap <buffer> ', 'g:atp_map_backward_motion_leader', 'p', '<Plug>vGotoPreviousPart"'], 
	    \ ['execute', 'map <buffer> ', 'g:atp_map_forward_motion_leader', 'e', '<Plug>GotoNextEnvironment"'], 
	    \ ['execute', 'map <buffer> ', 'g:atp_map_backward_motion_leader', 'e', '<Plug>GotoPreviousEnvironment"'], 
	    \ ['exe', 'map <buffer> ', 'g:atp_map_forward_motion_leader', '', '<Plug>GotoNextEnvironment"'], 
	    \ ['exe', 'map <buffer> ', 'g:atp_map_backward_motion_leader', '', '<Plug>GotoPreviousEnvironment"'], 
	    \ ['execute', 'map <buffer> ', 'g:atp_map_forward_motion_leader', 'm', '<Plug>GotoNextMath"'], 
	    \ ['execute', 'map <buffer> ', 'g:atp_map_backward_motion_leader', 'm', '<Plug>GotoPreviousMath"'], 
	    \ ['execute', 'map <buffer> ', 'g:atp_map_forward_motion_leader', 'M', '<Plug>GotoNextDisplayedMath"'], 
	    \ ['execute', 'map <buffer> ', 'g:atp_map_backward_motion_leader', 'M', '<Plug>GotoPreviousDisplayedMath"'], 
	    \ ['', 'nnoremap <buffer> <silent> ', '', 'gf', ':call atplib#motion#GotoFile("")<CR>'], 
	    \ ['', 'imap <silent> <buffer> ', '', '<F7>', '<C-R>=atplib#complete#TabCompletion(1)<CR>'], 
	    \ ['', 'nnoremap <silent> <buffer> ', '', '<F7>', ':call atplib#complete#TabCompletion(1,1)<CR>'], 
	    \ ['', 'imap <silent> <buffer> ', '', '<S-F7>', '<C-R>=atplib#complete#TabCompletion(0)<CR>'], 
	    \ ['', 'nnoremap <silent> <buffer> ', '', '<S-F7>', ':call atplib#complete#TabCompletion(0,1)<CR> '], 
	    \ ['', 'imap <silent> <buffer> ', '', '<Tab>', '<C-R>=atplib#complete#TabCompletion(1)<CR>'], 
	    \ ['', 'imap <silent> <buffer> ', '', '<S-Tab>', '<C-R>=atplib#complete#TabCompletion(0)<CR>'], 
	    \ ['', 'nnoremap <silent> <buffer> ', '', '<S-Tab>', ':call atplib#complete#TabCompletion(0,1)<CR> '], 
	    \ ['', 'vnoremap <buffer> <silent> ', '', '<F7>', ':WrapSelection ''\{'',''}'',''begin''<CR>'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'f', ':WrapSelection ''{\\usefont{".g:atp_font_encoding."}{}{}{}\\selectfont '', ''}'', ''".(len(g:atp_font_encoding)+11)."''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'rm', ':<C-U>InteligentWrapSelection [''\\textrm{''],[''\\mathrm{'']<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'em', ':<C-U>InteligentWrapSelection [''\\emph{''],[''\\mathit{'']<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'it', ':<C-U>InteligentWrapSelection [''\\textit{''],[''\\mathit{'']<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'sf', ':<C-U>InteligentWrapSelection [''\\textsf{''],[''\\mathsf{'']<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'tt', ':<C-U>InteligentWrapSelection [''\\texttt{''],[''\\mathtt{'']<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'bf', ':<C-U>InteligentWrapSelection [''\\textbf{''],[''\\mathbf{'']<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'bb', ':<C-U>InteligentWrapSelection [''\\textbf{''],[''\\mathbb{'']<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'sl', ':<C-U>WrapSelection ''\\textsl{''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'sc', ':<C-U>WrapSelection ''\\textsc{''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'up', ':<C-U>WrapSelection ''\\textup{''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'md', ':<C-U>WrapSelection ''\\textmd{''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'un', ':<C-U>WrapSelection ''\\underline{''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'ov', ':<C-U>WrapSelection ''\\overline{''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'no', ':<C-U>InteligentWrapSelection [''\\textnormal{''],[''\\mathnormal{'']<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_text_font_leader', 'cal', ':<C-U>InteligentWrapSelection [''''],[''\\mathcal{'']<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_environment_leader', 'C', ':WrapSelection ''"."\\"."begin{center}'',''"."\\"."end{center}'',''0'',''1''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_environment_leader', 'R', ':WrapSelection ''"."\\"."begin{flushright}'',''"."\\"."end{flushright}'',''0'',''1''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_environment_leader', 'L', ':WrapSelection ''"."\\"."begin{flushleft}'',''"."\\"."end{flushleft}'',''0'',''1''<CR>"'], 
	    \ ['', 'vmap <buffer> ', '', 'm', ':<C-U>WrapSelection ''\('', ''\)''<CR>'], 
	    \ ['', 'vmap <buffer> ', '', 'M', ':<C-U>WrapSelection ''\['', ''\]''<CR>'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_bracket_leader', '(', ':WrapSelection ''('', '')'', ''begin''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_bracket_leader', '[', ':WrapSelection ''['', '']'', ''begin''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_bracket_leader', '\\{', ':WrapSelection ''\\{'', ''\\}'', ''begin''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_bracket_leader', '{', ':WrapSelection ''{'', ''}'', ''begin''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_bracket_leader', ')', ':WrapSelection ''('', '')'', ''end''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_bracket_leader', ']', ':WrapSelection ''['', '']'', ''end''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_bracket_leader', '\\}', ':WrapSelection ''\\{'', ''\\}'', ''end''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_bracket_leader', '}', ':WrapSelection ''{'', ''}'', ''end''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_big_bracket_leader', '(', ':WrapSelection ''\\left('', ''\\right)'', ''begin''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_big_bracket_leader', '[', ':WrapSelection ''\\left['', ''\\right]'', ''begin''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_big_bracket_leader', '{', ':WrapSelection ''\\left\\{'',''\\right\\}'', ''begin''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_big_bracket_leader', '\\{', ':WrapSelection ''\\left\\{'',''\\right\\}'', ''begin''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_big_bracket_leader', ')', ':WrapSelection ''\\left('', ''\\right)'', ''end''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_big_bracket_leader', ']', ':WrapSelection ''\\left['', ''\\right]'', ''end''<CR>"'], 
	    \ ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_big_bracket_leader', '}', ':WrapSelection ''\\left\\{'', ''\\right\\}'', ''end''<CR>"'], ['execute', 'vnoremap <buffer> ', 'g:atp_vmap_big_bracket_leader', '\\}', ':WrapSelection ''\\left\\{'', ''\\right\\}'', ''end''<CR>"'], 
	    \ ['', 'nmap ', '', '<Localleader>a', ':TexAlign<CR>'], 
	    \ ['', 'vmap <silent> <buffer> ', '', 'ip', '<Plug>ATP_SelectCurrentParagraphInner'], 
	    \ ['', 'vmap <silent> <buffer> ', '', 'ap', '<Plug>ATP_SelectCurrentParagraphOuter'], 
	    \ ['', 'omap <buffer>  ', '', 'ip', ':normal vip<CR>'], 
	    \ ['', 'omap <buffer>  ', '', 'ap', ':normal vap<CR>'], 
	    \ ['', 'nmap <buffer> ', '', 'gw', 'm`vipgq``'], 
	    \ ['', 'nmap <buffer> ', '', 'g>', 'm`vip>``'], 
	    \ ['', 'nmap <buffer> ', '', 'g<', 'm`vip<``'], 
	    \ ['', 'nmap <buffer> ', '', '2g>', 'm`vip2>``'], 
	    \ ['', 'nmap <buffer> ', '', '2g<', 'm`vip2<``'], 
	    \ ['', 'nmap <buffer> ', '', '3g>', 'm`vip3>``'], 
	    \ ['', 'nmap <buffer> ', '', '3g<', 'm`vip3<``'], 
	    \ ['', 'nmap <buffer> ', '', '4g>', 'm`vip4>``'], 
	    \ ['', 'nmap <buffer> ', '', '4g<', 'm`vip4<``'], 
	    \ ['', 'nmap <buffer> ', '', '5g>', 'm`vip5>``'], 
	    \ ['', 'nmap <buffer> ', '', '5g<', 'm`vip5<``'], 
	    \ ['', 'nmap <buffer> ', '', '6g>', 'm`vip6>``'], 
	    \ ['', 'nmap <buffer> ', '', '6g<', 'm`vip6<``'], 
	    \ ['', 'vmap <buffer> <silent> ', '', 'aS', '<Plug>SelectOuterSyntax'], 
	    \ ['', 'vmap <buffer> <silent> ', '', 'iS', '<Plug>SelectInnerSyntax'], 
	    \ ['', 'nnoremap <silent><buffer> ', '', '[[', 'm'':call search(''\\begin\s*{'', "bW")<CR>'], ['', 'vnoremap <silent><buffer> ', '', '[[', 'm'':<C-U>exe "normal! gv"<Bar>call search(''\\begin\s*{'', "bW")<CR>'], ['', 'nnoremap <silent><buffer> ', '', ']]', 'm'':call search(''\\begin\s*{'', "W")<CR>'], ['', 'vnoremap <silent><buffer> ', '', ']]', 'm'':<C-U>exe "normal! gv"<Bar>call search(''\\begin\s*{'', "W")<CR>'], 
	    \ ['', 'nnoremap <silent><buffer> ', '', '[]', 'm'':call search(''\\end\s*{'', "bW")<CR>'], 
	    \ ['', 'vnoremap <silent><buffer> ', '', '[]', 'm'':<C-U>exe "normal! gv"<Bar>call search(''\\end\s*{'', "bW")<CR>'], 
	    \ ['', 'nnoremap <silent><buffer> ', '', '][', 'm'':call search(''\\end\s*{'', "W")<CR>'], 
	    \ ['', 'vnoremap <silent><buffer> ', '', '][', 'm'':<C-U>exe "normal! gv"<Bar>call search(''\\end\s*{'', "W")<CR>'], 
	    \ ['', 'nnoremap <silent><buffer> ', '', ']%', ':call search(''^\(\s*%.*\n\)\@<!\(\s*%\)'', "W")<CR>'], 
	    \ ['', 'vnoremap <silent><buffer> ', '', ']%', ':<C-U>exe "normal! gv"<Bar>call search(''^\(\s*%.*\n\)\@<!\(\s*%\)'', "W")<CR>'], 
	    \ ['', 'nnoremap <silent><buffer> ', '', '[%', ':call search(''\%(^\s*%.*\n\)\%(^\s*%\)\@!'', "bW")<CR>'], 
	    \ ['', 'vnoremap <silent><buffer> ', '', '[%', ':<C-U>exe "normal! gv"<Bar>call search(''\%(^\s*%.*\n\)\%(^\s*%\)\@!'', "bW")<CR>'], 
	    \ ['', 'vmap <silent><buffer> ', '', 'c', '<Plug>vSelectComment'], 
	    \ ['', 'nmap  <buffer> ', '', '<LocalLeader>v', '<Plug>ATP_ViewOutput'], 
	    \ ['', 'nmap  <buffer> ', '', '<F2>', '<Plug>ToggleSpace'], 
	    \ ['', 'nmap  <buffer> ', '', '<LocalLeader>s', '<Plug>ToggleStar'], 
	    \ ['', 'nmap  <buffer> ', '', '<LocalLeader>D', '<Plug>ToggleDebugMode'], 
	    \ ['', 'nmap  <buffer> ', '', '<F4>', '<Plug>ChangeEnv'], 
	    \ ['', 'nmap  <buffer> ', '', '<S-F4>', '<Plug>ToggleEnvForward'], 
	    \ ['', 'nmap  <buffer> ', '', '<C-S-F4>', '<Plug>LatexEnvPrompt'], 
	    \ ['', 'nmap  <buffer> ', '', '<F3>', '<Plug>ATP_ViewOutput'], 
	    \ ['', 'imap  <buffer> ', '', '<F3>', '<Esc><Plug>ATP_ViewOutput'], 
	    \ ['', 'nmap  <buffer> ', '', '<LocalLeader>g', '<Plug>Getpid'], 
	    \ ['', 'nmap  <buffer> ', '', '<LocalLeader>t', '<Plug>ATP_TOC'], 
	    \ ['', 'nmap  <buffer> ', '', '<LocalLeader>L', '<Plug>ATP_Labels'], 
	    \ ['', 'nmap  <buffer> ', '', '<LocalLeader>l', '<Plug>ATP_TeXCurrent'], 
	    \ ['', 'nmap  <buffer> ', '', '<LocalLeader>d', '<Plug>ATP_TeXDebug'], 
	    \ ['', 'nmap  <buffer> ', '', '<F5>', '<Plug>ATP_TeXVerbose'], 
	    \ ['', 'nmap  <buffer> ', '', '<s-F5>', '<Plug>ToggleAuTeX'], 
	    \ ['', 'imap  <buffer> ', '', '<s-F5>', '<Esc><Plug>ToggleAuTeXa'], 
	    \ ['', 'nmap  <buffer> ', '', '`<Tab>', '<Plug>ToggleTab'], 
	    \ ['', 'imap  <buffer> ', '', '`<Tab>', '<Plug>ToggleTab'], 
	    \ ['', 'nmap  <buffer> ', '', '<LocalLeader>B', '<Plug>SimpleBibtex'], 
	    \ ['', 'nmap  <buffer> ', '', '<LocalLeader>b', '<Plug>BibtexDefault'], 
	    \ ['', 'nmap  <buffer> ', '', '<F6>d', '<Plug>Delete'], 
	    \ ['', 'imap  <buffer> ', '', '<F6>d', '<Esc><Plug>Deletea'], 
	    \ ['', 'nmap  <buffer> <silent> ', '', '<F6>l', '<Plug>OpenLog'], 
	    \ ['', 'imap  <buffer> <silent> ', '', '<F6>l', '<Esc><Plug>OpenLog'], 
	    \ ['', 'nnoremap  <buffer> ', '', '<F6>', ':ShowErrors e<CR>'], 
	    \ ['', 'inoremap  <buffer> ', '', '<F6>e', ':ShowErrors e<CR>'], 
	    \ ['', 'nnoremap  <buffer> ', '', '<F6>w', ':ShowErrors w<CR>'], 
	    \ ['', 'inoremap  <buffer> ', '', '<F6>w', ':ShowErrors w<CR>'], 
	    \ ['', 'nnoremap  <buffer> ', '', '<F6>r', ':ShowErrors rc<CR>'], 
	    \ ['', 'nnoremap  <buffer> ', '', '<F6>r', ':ShowErrors rc<CR>'], 
	    \ ['', 'nnoremap  <buffer> ', '', '<F6>f', ':ShowErrors f<CR>'], 
	    \ ['', 'inoremap  <buffer> ', '', '<F6>f', ':ShowErrors f<CR>'], 
	    \ ['', 'nnoremap  <buffer> ', '', '<F6>g', '<Plug>PdfFonts'], 
	    \ ['', 'nnoremap  <buffer> ', '', '<F1>', ':TexDoc<space>'], 
	    \ ['', 'inoremap  <buffer> ', '', '<F1>', '<esc> 		:TexDoc<space>'], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'rm', '<Esc>:call Insert("\\textrm{", "\\mathrm{")<Cr>a'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'up', '\textup{}<Left>'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'md', '\textmd{}<Left>'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'it', '<Esc>:call Insert("\\textit{", "\\mathit{")<Cr>a'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'sl', '\textsl{}<Left>'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'sc', '\textsc{}<Left>'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'sf', '<Esc>:call Insert("\\textsf{", "\\mathsf{")<Cr>a'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'bf', '<Esc>:call Insert("\\textbf{", "\\mathbf{")<Cr>a'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'tt', '<Esc>:call Insert("\\texttt{", "\\mathtt{")<Cr>a'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'em', '\emph{}<Left>'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'no', '<Esc>:call Insert("\\textnormal{", "\\mathnormal{")<Cr>a'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'bb', '\mathbb{}<Left>'''], 
	    \ ['execute', 'inoremap <buffer>', 'g:atp_imap_second_leader', 'cal', '\mathcal{}<Left>'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'a', '\alpha'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'b', '\beta'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'c', '\chi'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'd', '\delta'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'e', '\epsilon'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 've', '\varepsilon'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'f', '\phi'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'y', '\psi'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'g', '\gamma'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'h', '\eta'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'k', '\kappa'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'l', '\lambda'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'i', '\iota'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'm', '\mu'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'n', '\nu'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'p', '\pi'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'o', '\theta'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'r', '\rho'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 's', '\sigma'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 't', '\tau'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'u', '\upsilon'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'vs', '\varsigma'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'vo', '\vartheta'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'w', '\omega'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'x', '\xi'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'z', '\zeta'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'D', '\Delta'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'Y', '\Psi'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'F', '\Phi'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'G', '\Gamma'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'L', '\Lambda'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'M', '\Mu'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'N', '\Nu'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'P', '\Pi'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'O', '\Theta'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'S', '\Sigma'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'T', '\Tau'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'U', '\Upsilon'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'W', '\Omega'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', 'Z', '\mathrm{Z}''  '], 
	    \ ['execute', 'imap <buffer> ', 'infty_leader', '8', '\infty''  '], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', '&', '\wedge''  '], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', '+', '\bigcup'' '], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_first_leader', '-', '\setminus'' '], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'b', '\begin{}<Left>'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'e', '\end{}<Left>'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'c', '\begin{center}<CR>\end{center}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_fourth_leader', 'c', '\begin{corollary}<CR>\end{corollary}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'd', '\begin{definition}<CR>\end{definition}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_fourth_leader', 'u', '\begin{enumerate}<CR>\end{enumerate}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'a', '\begin{align}<CR>\end{align}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'i', '\item'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_fourth_leader', 'i', '\begin{itemize}<CR>\end{itemize}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'l', '\begin{lemma}<CR>\end{lemma}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_fourth_leader', 'p', '\begin{proof}<CR>\end{proof}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'p', '\begin{proposition}<CR>\end{proposition}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 't', '\begin{theorem}<CR>\end{theorem}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_fourth_leader', 't', '\begin{center}<CR>\begin{tikzpicture}<CR><CR>\end{tikzpicture}<CR>\end{center}<Up><Up>'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'r', '\begin{remark}<CR>\end{remark}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_fourth_leader', 'l', '\begin{flushleft}<CR>\end{flushleft}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'r', '\begin{flushright}<CR>\end{flushright}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'f', '\begin{frame}<CR>\end{frame}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_fourth_leader', 'q', '\begin{equation}<CR>\end{equation}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'n', '\begin{note}<CR>\end{note}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'o', '\begin{observation}<CR>\end{observation}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'x', '\begin{example}<CR>\end{example}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'b', '\begin{}<Left>'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'e', '\end{}<Left>'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 't', '\begin{theorem}<CR>\end{theorem}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'd', '\begin{definition}<CR>\end{definition}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'P', '\begin{proposition}<CR>\end{proposition}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'l', '\begin{lemma}<CR>\end{lemma}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'r', '\begin{remark}<CR>\end{remark}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'C', '\begin{corollary}<CR>\end{corollary}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'p', '\begin{proof}<CR>\end{proof}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'x', '\begin{example}<CR>\end{example}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'n', '\begin{note}<CR>\end{note}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'E', '\begin{enumerate}<CR>\end{enumerate}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'I', '\begin{itemize}<CR>\end{itemize}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'i', '<Esc>:call InsertItem()<CR>a'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'a', '\begin{align}<CR>\end{align}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'q', '\begin{equation}<CR>\end{equation}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'c', '\begin{center}<CR>\end{center}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'L', '\begin{flushleft}<CR>\end{flushleft}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'R', '\begin{flushright}<CR>\end{flushright}<Esc>O'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'T', '\begin{center}<CR>\begin{tikzpicture}<CR><CR>\end{tikzpicture}<CR>\end{center}<Up><Up>'''], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'f', '\begin{frame}<CR>\end{frame}<Esc>O'''], 
	    \ ['', 'inoremap <silent> <buffer> ', '', '_', '<C-R>=<SID>SubBracket()<CR>'], 
	    \ ['', 'inoremap <silent> <buffer> ', '', '^', '<C-R>=<SID>SuperBracket()<CR>'], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'm', '\\(\\)<Left><Left>"'], 
	    \ ['execute', 'imap <buffer> ', 'g:atp_imap_third_leader', 'M', '\\\[\\]<Left><Left>"']
	    \ ]
function! DefineATPMaps()
    for map in g:atp_maps
	call feedkeys(":" . join(map, " "), "nt")
    endfor
endfunction