set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Section: Plugins
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Essential plugins:
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
" vim-buffalo requires vimple
Bundle 'dahu/vimple'
Bundle 'Raimondi/vim-buffalo'
Bundle 'dahu/vim-fanfingtastic'
Bundle 'paradigm/TextObjectify'
Bundle 'dahu/SearchParty'

Bundle 'AshyIsMe/2048'
Bundle 'dahu/tiktok'
Bundle 'dahu/vim-quiz'

Bundle 'dhruvasagar/vim-dotoo'

" Plugins to explore and remove:
"Bundle 'https://github.com/dahu/MarkMyWords'
"
"Try out echofunc sometime (function argument hints from tags file):
"http://www.vim.org/scripts/script[hp?script_id=1735
"
Bundle 'benmills/vimux'
Bundle 't9md/vim-choosewin'

Bundle 'dahu/VimGym'

Bundle 'joonty/vdebug.git'

"Bundle 'dbext.vim'
"Bundle 'SQLComplete.vim'

Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'nosami/Omnisharp'
Bundle 'mileszs/ack.vim'
Bundle 'ddollar/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-unimpaired'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/ZoomWin'
"Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'joonty/vdebug' 	" Gonna need this one later
"Bundle 'Yggdroot/indentLine'
" vim-scripts repos
Bundle 'L9'
"Bundle 'Markdown'
Bundle 'Superior-Haskell-Interaction-Mode-SHIM'
Bundle 'laurilehmijoki/haskellmode-vim'
Bundle 'dag/vim2hs'
Bundle 'Conque-Shell'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'airblade/vim-gitgutter'
"Bundle 'itchyny/calendar.vim'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'eagletmt/neco-ghc'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-indent'
Bundle 'cecutil'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

filetype plugin indent on     " required!


" Section: Settings
"
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ignorecase
"colorscheme railscasts
"colorscheme github
colorscheme zenburn
syntax enable
let &t_Co=256
set hlsearch
set hidden

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

map <F4> :nohl<CR>
"SearchParty does this <C-L> mapping now
"nnoremap <silent> <C-L> :nohlsearch<Bar>redraw!<CR>
map <Leader>cd :lcd %:p:h<CR>

"make Y work like C and D
map Y y$

nnoremap <c-p><c-p> :CtrlP<CR>
nnoremap <c-p><c-b> :CtrlPBuffer<CR>
nnoremap <c-p><c-t> :CtrlPTag<CR>

" global replace current word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>w :w<CR>

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
nnoremap <Leader>gg :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR><C-L>
" same in visual mode
vnoremap <leader>gg y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR><C-L>

"Exit out of diff mode with: <C-w><C-o>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gm :Gmove<CR>
nnoremap <Leader>gp :Git push

"Quick edit file list
"nnoremap <Leader>ev :e ~/dotrc/vimrc<CR>
nnoremap <Leader>ev :tabnew ~/dotrc/vimrc<CR>
nnoremap <Leader>sv :source ~/dotrc/vimrc<CR>
nnoremap <Leader>es :tabnew ~/dotrc/vimstickynotes.md<CR>
nnoremap <Leader>ea :tabnew ~/dotrc/vimannoyances.md<CR>
nnoremap <Leader>ep :tabnew ~/dotrc/projects.md<CR>

nnoremap <leader>p :set paste!<CR>:set paste?<CR>


nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>do :diffoff<CR>

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

"haskell browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
"vim2hs disable all conceals
let g:haskell_conceal = 0

"Haskell codex stuff (https://github.com/aloiscochard/codex)
set tags=tags;/,codex.tags;/
:au BufWritePost *.cabal !codex update
:au BufWritePost *.cabal exec "!hasktags -c '%:h'"
"AA TODO: Do the same with this command:
"find . | grep "\.hs" | xargs hscope -b

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
