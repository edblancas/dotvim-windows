" vim: nowrap fdm=marker

" Vundle.vim config {{{1
set nocompatible
filetype off

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim'
Plugin 'svermeulen/vim-easyclip'

call vundle#end()
filetype plugin indent on
" }}}

language messages en
set showcmd
set showmode
set backspace=indent,eol,start
set hidden
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set number
set ruler
set incsearch
set hlsearch
set wrap
set scrolloff=3
set nobackup
set nowritebackup
set noswapfile
set laststatus=2

set pastetoggle=<F2>
set cul
set encoding=utf-8
"set colorcolumn=100

" Mappings {{{1
" Override defaults {{{2
let mapleader = ","
nnoremap Q <Nop>
nnoremap <space> za
nnoremap j gj
nnoremap k gkkj

" File opening {{{2
cnoremap <expr> %% getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <Leader><Tab> :b#<CR>
map <Leader>n :new<CR>
map <Leader>d :bd<CR>
map <Leader>D :bd!<CR>
map <Leader>W :w \| bd<CR>
map <Leader>h :hide<CR>

" Smash Escape {{{2
inoremap jk <Esc>
inoremap kj <Esc>
inoremap JK <Esc>
inoremap KJ <Esc>

" Plugin Configuration {{{1
" CtrlP {{{2
silent! nnoremap <unique> <silent> <Leader>p :CtrlP<CR>
silent! nnoremap <unique> <silent> <Leader>b :CtrlPBuffer<CR>
silent! nnoremap <unique> <silent> <Leader>T :CtrlPTag<CR>
silent! nnoremap <unique> <silent> <Leader>t :CtrlPBufTag<CR>
silent! nnoremap <unique> <silent> <Leader>m :CtrlPMRUFiles<CR>
silent! nnoremap <unique> <silent> <Leader>o :CtrlPBookmarkDir<CR>
let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
\ 'link': 'some_bad_symbolic_links',
\ }
let g:ctrlp_map = ''
let g:ctrlp_follow_symlinks = 1

" EasyClip {{{2
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
xmap gs p
let g:EasyClipUseCutDefaults = 0
nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug
