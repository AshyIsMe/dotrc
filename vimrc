" Section: Pathogen {{{1
"Now using pathogen and git submodules to manage plugins
execute pathogen#infect()
syntax on
filetype plugin indent on

set rtp+=~/.fzf

" Section: Settings {{{1
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ignorecase
colorscheme zenburn
syntax enable
let &t_Co=256
set hlsearch
set hidden
set nobackup
set noswapfile
set autoindent
set foldmethod=marker

" Section: Statusline - TODO: airline or better {{{1
set statusline=%f
set statusline+=%m
set statusline+=\ \ %{getcwd()}
"set statusline+=%{RandomStickyLine()}
set statusline+=%=
set statusline+=Stickies:
let stickiescount=system("grep \"*\" ~/dotrc/vimstickynotes.md | wc -l | tr -d ' \n'")
set statusline+=%{stickiescount}

function! RandomStickyLine()
  let randomsticky=" | Random Sticky: " . system("grep \"*\" ~/dotrc/vimstickynotes.md | head -$((${RANDOM} % `grep \"*\" ~/dotrc/vimstickynotes.md | wc -l` + 1)) | tail -1 | tr -d '*\n'")
  return randomsticky
endfunction

set laststatus=2


" Section: Mappings {{{1

let mapleader = " "

" From Walt {{{2
"nnoremap / :FuzzySearch<CR>
map <Leader>cd :lcd %:p:h<CR>

" Randomness {{{2
noremap ; :
"noremap ;; ;
map ;; <Plug>fanfingtastic_;

nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable          = 1

map <leader>x :vimgrep /<C-R>// %<CR>:cope<CR>
nnoremap <leader>m :make<CR>

"SearchParty does this <C-L> mapping now
"nnoremap <silent> <C-L> :nohlsearch<Bar>redraw!<CR>
"Help! I've lost my cursor and can't find it!
"nnoremap <silent> <C-L> :set cursorline <bar> set cursorcolumn <bar> redraw <bar> sleep 80m <bar> set nocursorline <bar> set nocursorcolumn <bar> nohlsearch <bar> redraw! <CR>

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
nmap <Leader>p "*p
nmap <Leader>P "*P
vmap <Leader>p "*p
vmap <Leader>P "*P
"Clashes with this unfortunately
"nnoremap <leader>p :set paste!<CR>:set paste?<CR>

" vimux mappings
map <Leader>vp :VimuxPromptCommand<CR>
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction
" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Leader>vs "vy :call VimuxSlime()<CR>
" Select current paragraph and send it to tmux
nmap <Leader>vs vip<Leader>vs<CR>

"Why walk when you can fly?
"http://bairuidahu.deviantart.com/art/Flying-vs-Cycling-261641977
"nnoremap <Leader>l :ls<CR>:b<space>


" Fuzzy Finding {{{2
"
" CtrlP is great but not comprehensive.
" Who dares wins?  Fzf or Unite?
"
" Features wanted:
"  Files
"  Buffers
"  Tags
"  Registers - keybinds to yank/paste
"  OmniComplete - fuzzy completions
"  fuzzy commands for vim - instead of needing leader mappings just fuzzy complete the viml function name (unite already has this one)

"CtrlP mappings
nnoremap <c-p><c-p> :CtrlP<CR>
nnoremap <c-p><c-b> :CtrlPBuffer<CR>
nnoremap <c-p><c-t> :CtrlPTag<CR>
"""""nnoremap <leader><space> :CtrlPMRUFiles<CR>

"Unite mappings
"AA TODO: set unite to use ag searcher
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_command = 'ag'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>uf :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>uF :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
"nnoremap <leader>ur :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader><space> :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>uo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>uy :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>ub :<C-u>Unite -no-split -buffer-name=buffer  -start-insert buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)

  imap <buffer> <C-c>   <Plug>(unite_exit)
  nmap <buffer> <esc>   <Plug>(unite_exit)
endfunction


" Fugitive git shortcuts {{{2
"nnoremap <Leader>gs :Gstatus<CR>
"nnoremap <leader>gts :Gstatus<CR><C-W><S-T>
"Status now opens in new tab
nnoremap <leader>gs :Gstatus<CR><C-W><S-T>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gl :Glog<CR>
"browse in github or instaweb
"
"Exit out of diff mode with: <C-w><C-o>
nnoremap <Leader>gd :Gdiff<CR>
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
nnoremap <Leader>ev :tabnew ~/dotrc/vimrc<CR>
nnoremap <Leader>sv :source ~/dotrc/vimrc<CR>
nnoremap <Leader>es :tabnew ~/dotrc/vimstickynotes.md<CR>
nnoremap <Leader>ea :tabnew ~/dotrc/vimannoyances.md<CR>
nnoremap <Leader>ep :tabnew ~/dotrc/projects.md<CR>

" Randomness {{{2
"Remove trailing whitespace from all lines. (Gross, trailing whitespace!)
"Mnemonic CleanSpaces
nnoremap <leader>cs :%s/\s\+$//g<CR>

nnoremap <leader>js :set filetype=javascript<CR>

nnoremap <leader>e :Errors<CR>
nnoremap <leader>y yy p k :call NERDComment(0, "norm")<CR> j

"quick indentation checking
"From bairui
nnoremap <leader>C m`^:exe 'set cc'.(&cc =~ virtcol('.')?'-=':'+=').virtcol('.')<cr>``

"Arrow keys used to change window size
no <Down>  <C-w>-
no <Up>    <C-w>+
no <Left>  <C-w><
no <Right> <C-w>>

nnoremap <Leader>G :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>

function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

" Haskell bindings {{{2
"AA TODO: make this only valid for filetype=haskell
nnoremap <Leader>ht :GhcModType<CR>
nnoremap <Leader>hT :GhcModTypeInsert<CR>
nnoremap <Leader>hr :!cabal run<CR>
nnoremap <Leader>hb :!cabal build<CR>
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
:au BufWritePost *.cabal exec "!codex update &"
:au BufWritePost *.cabal exec "!hasktags -c '%:h' &"
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

" finally {{{2
" Not sure if this actually has to be last
set foldlevelstart=10

