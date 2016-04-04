" Vim syntax file
" Language:	Apache AVRO
" Maintainer:	Parham Alvani <parham.alvani@gmail.com>
" Last Change:	2016-04-04
" Version:      0.3
" {{{1

" Syntax setup {{{2
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'avro'
endif

" Syntax: Strings {{{2
syn region  jsonString    start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=jsonEscape, avroTypes, avroKeywords
" Syntax: JSON does not allow strings with single quotes, unlike JavaScript.
syn region  jsonStringSQ  start=+'+  skip=+\\\\\|\\"+  end=+'+

" Syntax: Escape sequences {{{3
syn match   jsonEscape    "\\["\\/bfnrt]" contained
syn match   jsonEscape    "\\u\x\{4}" contained

" Syntax: Strings should always be enclosed with quotes.
syn match   jsonNoQuotes  "\<\a\+\>"

" Syntax: Numbers {{{2
syn match   jsonNumber    "-\=\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\>"

" Syntax: An integer part of 0 followed by other digits is not allowed.
syn match   jsonNumError  "-\=\<0\d\.\d*\>"

" Syntax: Boolean {{{2
syn keyword jsonBoolean   true false

" Syntax: Null {{{2
syn keyword jsonNull      null

" Syntax: Braces {{{2
syn match   jsonBraces	   "[{}\[\]]"

" Syntax: Avro Types {{{2
syn match avroTypes /\<null\>/ contained
syn match avroTypes /\<boolean\>/ contained
syn match avroTypes /\<int\>/ contained
syn match avroTypes /\<long\>/ contained
syn match avroTypes /\<float\>/ contained
syn match avroTypes /\<double\>/ contained
syn match avroTypes /\<bytes\>/ contained
syn match avroTypes /\<string\>/ contained

syn match avroTypes /\<record\>/ contained
syn match avroTypes /\<array\>/ contained
syn match avroTypes /\<enum\>/ contained
syn match avroTypes /\<map\>/ contained
syn match avroTypes /\<union\>/ contained
syn match avroTypes /\<fixed\>/ contained

" Syntax: Avro Keywords {{{2
syn match avroKeywords /\<type\>/ contained
syn match avroKeywords /\<name\>/ contained
syn match avroKeywords /\<namespace\>/ contained
syn match avroKeywords /\<doc\>/ contained
syn match avroKeywords /\<aliases\>/ contained
syn match avroKeywords /\<fields\>/ contained
syn match avroKeywords /\<default\>/ contained
syn match avroKeywords /\<order\>/ contained
syn match avroKeywords /\<symbols\>/ contained
syn match avroKeywords /\<items\>/ contained
syn match avroKeywords /\<values\>/ contained
syn match avroKeywords /\<size\>/ contained

" Define the default highlighting. {{{1
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_avro_syn_inits")
  if version < 508
    let did_json_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink jsonString             String
  HiLink jsonEscape             Special
  HiLink jsonNumber		Number
  HiLink jsonBraces		Operator
  HiLink jsonNull		Function
  HiLink jsonBoolean		Boolean
  HiLink avroTypes              Type
  HiLink avroKeywords           Statement

  HiLink jsonNumError           Error
  HiLink jsonStringSQ           Error
  HiLink jsonNoQuotes           Error
  delcommand HiLink
endif

let b:current_syntax = "avro"
if main_syntax == 'avro'
  unlet main_syntax
endif

" Vim settings {{{2
" vim: ts=8 fdm=marker
