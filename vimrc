

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
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
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/ZoomWin'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'joonty/vdebug' 	" Gonna need this one later
Bundle 'Yggdroot/indentLine'
" vim-scripts repos
Bundle 'L9'
Bundle 'Markdown'
Bundle 'Superior-Haskell-Interaction-Mode-SHIM'
"Bundle 'laurilehmijoki/haskellmode-vim'
Bundle 'dag/vim2hs'
Bundle 'Conque-Shell'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..



set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ignorecase

let mapleader = " "
map ; :
noremap ;; ;

map <F4> :nohl<CR>
map <Leader>cd :lcd %:p:h<CR>
map <c-t> :CtrlPBufTag<CR>

" global replace current word
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

:nnoremap <silent> <C-L> :nohlsearch<Bar>redraw!<CR>

:nnoremap <Leader>n :tabnew<CR>

"Fugitive git shortcuts
:nnoremap <Leader>gs :Gstatus<CR>
:nnoremap <Leader>gc :Gcommit<CR>
:nnoremap <Leader>gb :Gblame<CR>
"browse in github or instaweb
:nnoremap <Leader>gg :Gbrowse<CR>
:nnoremap <Leader>gd :Gdiff<CR>
:nnoremap <Leader>gm :Gmove<CR>
:nnoremap <Leader>gp :Git push

":nnoremap <Leader>ev :e ~/.vimrc<CR>
:nnoremap <Leader>ev :e ~/dotrc/vimrc<CR>

"colorscheme railscasts
"colorscheme github
syntax enable
let &t_Co=256

source ~/.vim/DropboxPaste.vim

set hlsearch

"haskell browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"
