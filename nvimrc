
"Now using pathogen and git submodules to manage plugins
execute pathogen#infect()
syntax on
filetype plugin indent on

nnoremap / :FuzzySearch<CR>

set rtp+=~/.fzf

filetype plugin indent on


" Section: Settings
"
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ignorecase
colorscheme github
syntax enable
let &t_Co=256
set hlsearch
set hidden
set nobackup
set noswapfile

"statusline setting
set statusline=%f
set statusline+=%m
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


" Section: Mappings
"

nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable          = 1


let mapleader = " "
noremap ; :
"noremap ;; ;
map ;; <Plug>fanfingtastic_;

"From Walt
"Open current file in next window(requires at least one split open)
"nnoremap <leader>z <esc><c-w>w:CtrlPMRUFiles<CR><CR>
"Open new tab and bring up MRU list
"nnoremap <leader>t :tabnew<CR>:CtrlPMRUFiles<CR>
"Open new vertical split and bring up MRU list
nnoremap <leader>v <c-w>v<c-w>w:CtrlPMRUFiles<CR>
"Quicker mapping for going to next window
"nnoremap <leader>q <c-w>w
map <leader>x :vimgrep /<C-R>// %<CR>:cope<CR>

nnoremap / :FuzzySearch<CR>

map <F4> :nohl<CR>
"SearchParty does this <C-L> mapping now
"nnoremap <silent> <C-L> :nohlsearch<Bar>redraw!<CR>
map <Leader>cd :lcd %:p:h<CR>

"make Y work like C and D
map Y y$

nnoremap <c-p><c-p> :CtrlP<CR>
nnoremap <c-p><c-b> :CtrlPBuffer<CR>
nnoremap <c-p><c-t> :CtrlPTag<CR>
nnoremap <leader><space> :CtrlPMRUFiles<CR>

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

"Fugitive git shortcuts
"nnoremap <Leader>gs :Gstatus<CR>
"nnoremap <leader>gts :Gstatus<CR><C-W><S-T>
"Status now opens in new tab
nnoremap <leader>gs :Gstatus<CR><C-W><S-T>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gl :Glog<CR>
"browse in github or instaweb

"nnoremap <Leader>gg :Ggrep
"Better Ggrep mappings
" global git search for word under the cursor (with highlight)
:command! -nargs=1 G silent Ggrep <args> | cwindow | redraw!
:nnoremap <leader>gg :G<space>
nnoremap <Leader>gG :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR><C-L>
" same in visual mode
vnoremap <leader>gg y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR><C-L>

"Exit out of diff mode with: <C-w><C-o>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gm :Gmove<CR>
nnoremap <Leader>gp :Git push

"Quick edit file list
"nnoremap <Leader>ev :e ~/dotrc/vimrc<CR>
nnoremap <Leader>ev :tabnew ~/dotrc/nvimrc<CR>
nnoremap <Leader>sv :source ~/dotrc/nvimrc<CR>
nnoremap <Leader>es :tabnew ~/dotrc/vimstickynotes.md<CR>
nnoremap <Leader>ea :tabnew ~/dotrc/vimannoyances.md<CR>
nnoremap <Leader>ep :tabnew ~/dotrc/projects.md<CR>


"Remove trailing whitespace from all lines. (Gross, trailing whitespace!)
"Mnemonic CleanSpaces
nnoremap <leader>cs :%s/\s\+$//g<CR>

nnoremap <leader>js :set filetype=javascript<CR>

nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>do :diffoff!<CR>

"quick indentation checking
nnoremap <leader>C :call ToggleCC()<CR>
function! ToggleCC()
  if &cc ==? 0
    let &cc = col(".")
  else
    let &cc=0
  endif
endfunction


"Arrow keys used to change window size
no <Down>  <C-w>-
no <Up>    <C-w>+
no <Left>  <C-w><
no <Right> <C-w>>


"Haskell bindings
"AA TODO: make this only valid for filetype=haskell
nnoremap <Leader>ht :GhcModType<CR>
nnoremap <Leader>hT :GhcModTypeInsert<CR>
"AA TODO: Fix the section hotkeys for useful defaults in Haskell and
"Javascript - See :h section - eg: :map [[ ?{<CR>w99[{

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

function! SetToCabalBuild()
  if glob("*.cabal") != ''
    set makeprg=cabal\ build
  endif
endfunction
autocmd BufEnter *.hs,*.lhs :call SetToCabalBuild()

nnoremap <Leader>G :silent execute "grep! -R " . shellescape(expand("<cword>")) . " ."<cr>:copen<cr>


function! SortLines() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp/'

set foldlevelstart=10


