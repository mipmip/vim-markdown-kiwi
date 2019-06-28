if exists('b:current_syntax')
endif

let s:padding_left = repeat(' ', get(g:, 'wimpimenu_padding_left', 3))

syntax sync fromstart

if exists('b:wimpimenu.option_lines')
  let s:col = len(s:padding_left) + 4
  for line in b:wimpimenu.option_lines
    exec 'syntax region WimpimenuOption start=/\%'. line .
          \ 'l'.''. '/ end=/$/'
  endfor
endif

execute 'syntax match WimpimenuBracket /.*\%'. (len(s:padding_left) + 5) .'c/ contains=
      \ WimpimenuNumber,
      \ WimpimenuSelect'

syntax match WimpimenuNumber  /^\s*\[\zs[^BSVT]\{-}\ze\]/
syntax match WimpimenuSelect  /^\s*\[\zs[BSVT]\{-}\ze\]/
syntax match WimpimenuSpecial /\V<close>\|<quit>/


if exists('b:wimpimenu.section_lines')
  for line in b:wimpimenu.section_lines
    exec 'syntax region WimpimenuSection start=/\%'. line .'l/ end=/$/'
  endfor
endif

if exists('b:wimpimenu.text_lines')
  for line in b:wimpimenu.text_lines
    exec 'syntax region WimpimenuText start=/\%'. line .'l/ end=/$/'
  endfor
endif

if exists('b:wimpimenu.header_lines')
  for line in b:wimpimenu.header_lines
    exec 'syntax region WimpimenuHeader start=/\%'. line .'l/ end=/$/'
  endfor
endif




function! s:hllink(name, dest, alternative)
  let tohl = a:dest
  if hlexists(a:alternative)
    let tohl = a:alternative
  endif
  if v:version < 508
    exec "hi link ".a:name.' '.tohl
  else
    exec "hi def link ".a:name.' '.tohl
  endif
endfunc

command! -nargs=* HighLink call s:hllink(<f-args>)


HighLink	WimpimenuBracket		Delimiter	StartifyBracket
HighLink	WimpimenuSection		Statement	StartifySection
HighLink	WimpimenuSelect			Title		StartifySelect
HighLink	WimpimenuNumber			Number		StartifyNumber
HighLink	WimpimenuSpecial		Comment		StartifySpecial
HighLink	WimpimenuHeader			Title		StartifyHeader
HighLink	WimpimenuOption			Identifier  StartifyFile
HighLink	WimpimenuHelp			Comment 	StartifySpecial	
