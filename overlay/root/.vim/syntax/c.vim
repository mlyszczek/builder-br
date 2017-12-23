" Preprocs
syn keyword cDefined defined contained containedin=cDefine
hi def link cDefined cDefine

" Functions
syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1 contains=cType,cDelimiter,cDefine
syn match cUserFunctionPointer "(\s*\*\s*\h\w*\s*)\(\s\|\n\)*(" contains=cDelimiter,cOperator

" Delimiters
"syn match cDelimiter    "[();\\]"
" foldmethod=syntax fix, courtesy of Ivan Freitas
syn match cBraces  "[{}]"

let s:cpo_save = &cpo
set cpo&vim

if version >= 508 || !exists('did_c_syntax_posix_inits')
  if version < 508
    let did_c_syntax_posix_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cPosixType Type
  HiLink cPosixEnum Type
  HiLink cPosixStruct Type
  HiLink cPosixVariable Identifier
  HiLink cPosixConstant Constant
  HiLink cPosixEnumConstant Constant
  HiLink cPosixFunction Function
  HiLink cAnsiFunction Function
  HiLink cAnsiName Identifier
  HiLink cUserFunction UserFunction
  HiLink cUserFunctionPointer UserFunction
  HiLink cDelimiter Delimiter
  HiLink cBraces Function
  delcommand HiLink
endif

let &cpo = s:cpo_save
unlet s:cpo_save

