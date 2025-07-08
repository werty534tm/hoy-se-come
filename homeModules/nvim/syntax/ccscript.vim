" Vim syntax file
" Language: CCScript

if exists("b:current_syntax")
  finish
endif

syn keyword ccscriptTodo	contained TODO FIXME XXX NOTE
syn match ccscriptComment	"//.*$" contains=ccscriptTodo
syntax region ccscriptComment	start="/\*"  end="\*/" contains=ccscriptTodo fold

syn keyword ccscriptStatement	define long ROM byte else menu ROMTBL flag short default if
syn keyword ccscriptStatement	command nextgroup=ccscriptFunction skipwhite

syn match ccscriptOperator	"\v\="
syn keyword ccscriptOperator	and or not

syn match ccscriptFunction	"\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

syn keyword ccscriptPreProc	import count

syn region ccscriptString	start=/\v"/ skip=/\v\\./ end=/\v"/
syn match ccscriptNumber	/\<[0-9]\+/
syn match ccscriptNumber	/\<0x[0-9A-Fa-f]\+/

let b:currentsyntax = "ccscript"

hi def link ccscriptTodo	Todo
hi def link ccscriptComment	Comment
hi def link ccscriptString	Constant
hi def link ccscriptStatement	Statement
hi def link ccscriptPreProc	PreProc
hi def link ccscriptNumber	Constant
hi def link ccscriptFunction	Function
hi def link ccscriptOperator	Operator
