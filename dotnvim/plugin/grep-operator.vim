
nnoremap <Leader>G :set operatorfunc=GrepOperator<cr>g@
vnoremap <Leader>G :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
  echom a:type
endfunction


