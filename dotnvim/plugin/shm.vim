"Structured Haskell Mode
"First attempt at the vim portion of Chris Done's Structured-haskell-mode: https://github.com/chrisdone/structured-haskell-mode

"Start with navigation features
    ";; Navigation
    "(define-key map (kbd "c-m-f") 'shm/forward-node)
    "(define-key map (kbd "c-m-b") 'shm/backward-node)
    "(define-key map (kbd "M-a") 'shm/goto-parent)
    "(define-key map (kbd ")") 'shm/close-paren)
    "(define-key map (kbd "]") 'shm/close-bracket)
    "(define-key map (kbd "}") 'shm/close-brace)
    "(define-key map (kbd "M-}") 'shm/forward-paragraph)
    "(define-key map (kbd "M-{") 'shm/backward-paragraph)
    "(define-key map (kbd "C-M-SPC") 'shm/mark-node)
    "(define-key map (kbd "C-c C-w") 'shm/goto-where)

"(defun shm/forward-node ()
  "AA TODO: Finish me!
function! SHMForwardNode()
  "shm-node-backwards
  "shm-current-node-pair
  "shm-node-end 
endfunction

"function! SHMGotoParent(node-pair direction)
  "AA TODO: Finish me!
function! SHMGotoParent()
  let node_pair=SHMCurrentWorkableNode()
  let direction="start"

  "AA TODO: implement these:
  "shm-current-workable-node
  "shm-node-parent 
  "shm-set-node-overlay 

endfunction

function! SHMDeclAST(...)
  "Optional argument: Boolean reparse
  let reparse = 0
  if a:0
    let reparse = a:1
  endif

  let p = SHMDeclPoints()
  return SHMGetDeclAST(p[0], p[1], reparse)
endfunction

function! SHMDeclPoints()
  "SHMDeclPoints() => [startpos, endpos]
  "setpos(".", startpos) to move to a position

  "Get the start and end position of the current
  "declaration. This assumes that declarations start at column zero
  "and that the rest is always indented by at least one space afterwards, so
  "Template Haskell uses with it all being at column zero are not
  "expected to work.

  "Save the marks and restore them.  From cecutil: http://vim.sourceforge.net/scripts/script.php?script_id=1066
  "let tempmarks = map(['q', 's', 'e'], 'SaveMark(v:val)')
  let markq = SaveMark('q')

  "save current cursor position
  execute "normal! mq"

  call search('^\S', 'b')
  let start = getpos(".")
  call search('^\S')
  execute "normal! k$"
  let end = getpos(".")

  "Restore previous cursor position
  execute "normal! `q"

  "call map(tempmarks, 'RestoreMark(v:val)')
  call RestoreMark(markq)

  return [start, end]
endfunction

function! SHMGetDeclAST(start, end, ...)
  "Get the AST of the declaration starting at POINT.
  "Optional argument: Boolean reparse
  let reparse = 0
  if a:0
    let reparse = a:1
  endif

  "AA TODO: Always reparse for now. Optimise later.

  let ast = SHMGetNodes(SHMGetAST("decl", a:start, a:end), a:start, a:end)
  if len(ast)
    "AA TODO
    "call SHMSetDeclAST(a:start, ast)
  endif

  return ast
endfunction

function! SHMGetNodes(ast, start, end)
  "AA TODO: start and end redundant here?

  let astsplit = split(a:ast, '\]\zs')
  let astsplit = map(astsplit, "substitute(v:val, '\\[', '', 'g')")
  let astsplit = map(astsplit, "substitute(v:val, '\\]', '', 'g')")
  let astsplit = map(astsplit, "substitute(v:val, '\"', '', 'g')")
  let astsplit = map(astsplit, "split(v:val)")

  let astsplit = map(astsplit, "[join(v:val[0:1], ' ')] + v:val[2:6]")

  return astsplit
endfunction

function! SHMGetAST(type, start, end)
  let currentbuffer=join(getline(a:start[1],a:end[1]), "\n")
  let ast=system('structured-haskell-mode parse ' . a:type, currentbuffer)
  return ast
endfunction 
