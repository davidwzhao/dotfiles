" Vim syntax file
" Language: Delve
" Maintainer: Ryan Curtin
" Latest Revision: Jul 09 2020

if exists("b:current_syntax")
  finish
endif

"
" Decl keywords
"
syn keyword delveBasicLanguageKeywords def
syn keyword delveBasicLanguageKeywords ic
syn keyword delveBasicLanguageKeywords bound
syn keyword delveBasicLanguageKeywords entity

"
" Attributes (adapted from python.vim)
"
syn match delveAttribute "@" display contained
syn match delveAttributeName "@\s*\h\%(\w\|\.\)*" display contains=delveAttribute

"
" Comments (adapted from c.vim and tex.vim)
"
syn region delveCommentL start="//" skip="\\$" end="$" keepend
syn region delveMultilineComment start="/\*" end="\*/" keepend

"
" Operator keywords
"
syn keyword delveOperatorKeywords exists forall and or not for in from
syn match delveMathOperators "+\|-\|\*\|/^[/]\|<\|>\|=\|!"

" this probably isn't very good...
syn match delveString "\"[^\"]*\"\|'.'" display
syn match delveSymbol ":\h\(\h\|\d\)*" display
syn match delveNumbers "\<\d\+\(\.\d\+\)\?\>" display

syn match delveBrackets "(\|)\|\[\|\]\|{\|}" display

" Assign types from earlier to vim highlighting types.
hi def link delveBasicLanguageKeywords Function

hi def link delveAttribute Define
hi def link delveAttributeName Define

hi def link delveCommentL Comment
hi def link delveMultilineComment Comment

hi def link delveOperatorKeywords Operator
hi def link delveMathOperators Operator

hi def link delveString String
hi def link delveSymbol Constant
hi def link delveNumbers Number

hi def link delveBrackets Special
