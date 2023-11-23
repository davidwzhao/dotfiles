" Vim syntax file
" Language: Rel
" Maintainer: Ryan Curtin
" Latest Revision: June 3 2021

if exists("b:current_syntax")
  finish
endif

"
" Decl keywords
"
syn keyword relBasicLanguageKeywords def
syn keyword relBasicLanguageKeywords ic
syn keyword relBasicLanguageKeywords bound
syn keyword relBasicLanguageKeywords entity

"
" Attributes (adapted from python.vim)
"
syn match relAttribute "@" display contained
syn match relAttributeName "@\s*\h\%(\w\|\.\)*" display contains=relAttribute

"
" Comments (adapted from c.vim and tex.vim)
"
syn region relCommentL start="//" skip="\\$" end="$" keepend contains=relTodo
syn region relMultilineComment start="/\*" end="\*/" keepend contains=relTodo
syn region relDocstring start=+doc"""+ end=+"""+ keepend
syn keyword relTodo TODO FIXME XXX contained

"
" Operator keywords
"
syn keyword relOperatorKeywords exists forall and or not for in from
syn match relMathOperators "+\|-\|\*\|/^[/]\|<\|>\|=\|!"

" this probably isn't very good...
" syn region relMultilineString start="\"\"\"" end="\"\"\"" keepend
syn match relString "\"[^\"]*\"\|'.'" display
syn match relSymbol ":\h\(\h\|\d\)*" display
syn match relNumbers "\<\d\+\(\.\d\+\)\?\>" display

syn match relBrackets "(\|)\|\[\|\]\|{\|}" display

" Assign types from earlier to vim highlighting types.
hi def link relBasicLanguageKeywords Function

hi def link relAttribute Define
hi def link relAttributeName Define

hi def link relCommentL Comment
hi def link relMultilineComment Comment
hi def link relDocstring Comment
hi def link relTodo Todo

hi def link relOperatorKeywords Operator
hi def link relMathOperators Operator

" hi def link relMultilineString String
hi def link relString String
hi def link relSymbol Constant
hi def link relNumbers Number

hi def link relBrackets Special
