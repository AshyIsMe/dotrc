" Section: Pathogen {{{1
"Now using pathogen and git submodules to manage plugins
execute pathogen#infect()
Helptags
syntax on
filetype plugin indent on

set rtp+=~/.fzf

" Section: Settings {{{1
set relativenumber
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ignorecase
syntax enable
"set background=light
set background=dark
colorscheme zenburn
"colorscheme solarized
let &t_Co=256
set hlsearch
set hidden
set nobackup
set noswapfile
set autoindent
set foldmethod=marker

" orgmode {{{2
let g:org_agenda_files=['~/Dropbox/orgmode/*.org']

" Update tmux pane names
" Teach vim the tmux escape sequences for changing pane title
" Note the "^[" should be a literal escape code (use `^v<esc>` to enter it)
if exists('$TMUX')
  set t_ts=]2;
  set t_fs=\\
  augroup RefreshTitle
    autocmd!
    autocmd BufEnter * let &titlestring = ' ' . expand("%:p:.")
  augroup END
  set title
endif

" Trailing Whitespace {{{1
" Show trailing whitepace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

" Make listchars show dashes for trailing whitespace
set listchars+=trail:-


" Section: Statusline - TODO: airline or better {{{1
"set statusline=%f
"set statusline+=%m
"set statusline+=\ \ %{getcwd()}
""set statusline+=%{RandomStickyLine()}
"set statusline+=%=
"set statusline+=Stickies:
"let stickiescount=system("grep \"*\" ~/dotrc/vimstickynotes.md | wc -l | tr -d ' \n'")
"set statusline+=%{stickiescount}

function! RandomStickyLine()
  let randomsticky=" | Random Sticky: " . system("grep \"*\" ~/dotrc/vimstickynotes.md | head -$((${RANDOM} % `grep \"*\" ~/dotrc/vimstickynotes.md | wc -l` + 1)) | tail -1 | tr -d '*\n'")
  return randomsticky
endfunction

set laststatus=2

" from mjanssen in #vim
" Use like :ToBuffer :map<CR>
function! ToBuffer(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command ToBuffer call ToBuffer(<q-args>)

"command! -complete=command ShowMap call ToBuffer(":map")


" Section: Mappings {{{1

let mapleader = " "

" From Walt {{{2
"nnoremap / :FuzzySearch<CR>
map <Leader>cd :lcd %:p:h<CR>

" Randomness {{{2
"noremap ; :
"noremap ;; ;
"map ;; <Plug>fanfingtastic_;

nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable          = 1

map <leader>x :vimgrep /<C-R>// %<CR>:cope<CR>
nnoremap <leader>m :make<CR>

"SearchParty does this <C-L> mapping now
"nnoremap <silent> <C-L> :nohlsearch<Bar>redraw!<CR>
"Help! I've lost my cursor and can't find it!
nnoremap <silent> <C-L> :set cursorline <bar> set cursorcolumn <bar> redraw <bar> sleep 80m <bar> set nocursorline <bar> set nocursorcolumn <bar> nohlsearch <bar> redraw! <CR>

"make Y work like C and D
map Y y$

" global replace current word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>S :%s/\s\+$//g<CR>

nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bD :bd!<CR>
" Save a file faster.
nnoremap <Leader>w :update<CR>
" Copy and paste to system clipboard easily
" Stolen from here: http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
vmap <Leader>y "*y
vmap <Leader>d "*d
"nmap <Leader>p "*p
"nmap <Leader>P "*P
nnoremap <Leader>p :set paste <bar> :normal "*p <bar> :set nopaste <CR>
nnoremap <Leader>P :set paste <bar> :normal "*P <bar> :set nopaste <CR>
vmap <Leader>p "*p
vmap <Leader>P "*P
"Clashes with this unfortunately
"nnoremap <leader>p :set paste!<CR>:set paste?<CR>


"" vimux mappings
"map <Leader>vp :VimuxPromptCommand<CR>
"function! VimuxSlime()
  "call VimuxSendText(@v)
  "call VimuxSendKeys("Enter")
"endfunction
"" If text is selected, save it in the v buffer and send that buffer it to tmux
"vmap <Leader>vs "vy :call VimuxSlime()<CR>
"" Select current paragraph and send it to tmux
"nmap <Leader>vs vip<Leader>vs<CR>

"Why walk when you can fly?
"http://bairuidahu.deviantart.com/art/Flying-vs-Cycling-261641977
"nnoremap <Leader>l :ls<CR>:b<space>

" Fugitive git shortcuts {{{2
"nnoremap <Leader>gs :Gstatus<CR>
"nnoremap <leader>gts :Gstatus<CR><C-W><S-T>
"Status now opens in new tab
nnoremap <leader>gs :Gstatus<CR><C-W><S-T>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gl :silent Glog <Bar> copen <CR> 

"browse in github or instaweb
"
"Exit out of diff mode with: <C-w><C-o>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gm :Gmove<CR>
nnoremap <Leader>gp :Git push

nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>do :diffoff!<CR>



"nnoremap <Leader>gg :Ggrep
"Better Ggrep mappings
" global git search for word under the cursor (with highlight)
:command! -nargs=1 G silent Ggrep <args> | cwindow | redraw!
:nnoremap <leader>gg :G<space>
nnoremap <Leader>gG :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR><C-L>
" same in visual mode
vnoremap <leader>gg y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR><C-L>

" Quick edit file list {{{2
"nnoremap <Leader>ev :e ~/dotrc/vimrc<CR>
nnoremap <Leader>v :e ~/dotrc/vimrc<CR>
"nnoremap <Leader>ev :tabnew ~/dotrc/vimrc<CR>
nnoremap <Leader>sv :source ~/dotrc/vimrc<CR>
"nnoremap <Leader>es :tabnew ~/dotrc/vimstickynotes.md<CR>
"nnoremap <Leader>ea :tabnew ~/dotrc/vimannoyances.md<CR>
"nnoremap <Leader>ep :tabnew ~/dotrc/projects.md<CR>

" Trialing new FZF mappings
" TODO: MRU plugin
":History is a cheap replacement for MRU
" TODO :Ag hotkey.  Change to use only git files
"nnoremap <Leader>a :Ag<CR>
nnoremap <Leader>a :Rg<CR>
nnoremap <Leader>e :Files<CR>
nnoremap <Leader>ff :Locate ~<CR>
nnoremap <Leader>fg :GitFiles<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader><Space> :History<CR>
nnoremap <Leader>fH :Helptags<CR>
nnoremap <Leader>ft :Tags<CR>
nnoremap <Leader>fT :BTags<CR>
nnoremap <Leader>fc :Commands<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fm :Maps<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :AgHistory hotkey.  Like :Ag but searches through files from History
command! AgHistory call fzf#vim#ag_raw(shellescape('^(?=.)').' '.
\ join(map(filter(copy(v:oldfiles), 'filereadable(expand(v:val))'), 'shellescape(expand(v:val))')),
\ {'down': '40%'})

" Mnemonic fp for Fzf Previous.  fh and fH already in use.
nnoremap <Leader>fp :AgHistory<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


" Randomness {{{2

"Remove trailing whitespace from all lines. (Gross, trailing whitespace!)
nnoremap <leader>$ :%s/\s\+$//g<CR>

nnoremap <leader>js :set filetype=javascript<CR>

nnoremap <leader>E :Errors<CR>
nnoremap <leader>y yy p k :call NERDComment(0, "norm")<CR> j

"quick indentation checking
"From bairui
"nnoremap <leader>C m`^:exe 'set cc'.(&cc =~ virtcol('.')?'-=':'+=').virtcol('.')<cr>``
nnoremap <leader>C :set cursorcolumn!<cr>

"Arrow keys used to change window size
no <Down>  <C-w>-
no <Up>    <C-w>+
no <Left>  <C-w><
no <Right> <C-w>>

"nnoremap <Leader>G :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>
nnoremap <Leader>G :silent :grep! "\b<C-R><C-W>\b"<CR>:cw<CR> :redraw!<CR>


function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

" Haskell bindings {{{2
augroup HaskellMappings
  autocmd!
  "autocmd FileType haskell nnoremap <Leader>ht :GhcModType<CR>
  "autocmd FileType haskell nnoremap <Leader>hT :GhcModTypeInsert<CR>
  autocmd FileType haskell nnoremap <Leader>ht :HdevtoolsType<CR>
  autocmd FileType haskell nnoremap <Leader>hr :!cabal run<CR>
  autocmd FileType haskell nnoremap <Leader>hb :!cabal build<CR>
augroup END

"AA TODO:
"   - Fix the section hotkeys for useful defaults in Haskell and Javascript
"     - See :h section - eg: :map [[ ?{<CR>w99[{
"     - [{ ]}, [( ]), [m ]m etc

"haskell browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
"vim2hs disable all conceals
let g:haskell_conceal = 0

"Haskell codex stuff (https://github.com/aloiscochard/codex)
set tags=tags;/,codex.tags;/
"AA TODO: Use the new vim8 jobs for this
:au BufWritePost *.cabal exec "silent !codex update &>/dev/null &"
:au BufWritePost *.cabal exec "silent !hasktags -c '%:h' &>/dev/null &"
:au BufWritePost *.cabal redraw
"AA TODO: Do the same with this command:
"find . | grep "\.hs" | xargs hscope -b
"Steal the hscope settings from here: https://github.com/begriffs/haskell-vim-now

function! SetHaskellMakePRG()
  if glob("*.cabal") != ''
    "set makeprg=cabal\ build
    set makeprg=stack\ build
  endif
endfunction
autocmd BufEnter *.hs,*.lhs :call SetHaskellMakePRG()

" grepprg {{{2
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  "set grepprg=ag\ --nogroup\ --nocolor
  set grepprg=ag\ --nogroup

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_user_command = 'ag %s -l -g ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp/'


" ansible {{{2
augroup AnsibleFiletypes
  autocmd!
  autocmd Bufread,BufNewFile playbook*.yaml set ft=ansible
  autocmd Bufread,BufNewFile playbook*.yml set ft=ansible
  autocmd Bufread,BufNewFile *inventory set ft=ansible_hosts
augroup END

" Python {{{2
"augroup PythonFiletypes
  "autocmd!
"autocmd FileType python set tabstop=4 set softtabstop=4 set shiftwidth=4 set textwidth=79 set expandtab set autoindent set fileformat=unix
autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab
"augroup END

" j (apl) {{{2


let g:reply_repls = {
\   'j': [
\     {-> reply#repl#base('ijconsole', {
\       'prompt_start' : '^    ',
\       'prompt_continue' : v:null,
\     })}
\   ],
\ }

nnoremap <leader><CR> :ReplSend<CR>
vnoremap <leader><CR> :ReplSend<CR>

" finally {{{2
" Not sure if this actually has to be last
set foldlevelstart=10

set visualbell
