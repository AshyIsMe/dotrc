
setlocal omnifunc=necoghc#omnifunc


if has("cscope")
  set cscopeprg=/Users/aaron/Library/Haskell/bin/hscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("hscope.out")
      cs add hscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb

	map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
	map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

endif

