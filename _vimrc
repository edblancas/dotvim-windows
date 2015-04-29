" vim: nowrap fdm=marker

" Vundle.vim config {{{1
set nocompatible
filetype off

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'chrisbra/NrrwRgn'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'd11wtq/ctrlp_bdelete.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'AutoComplPop'
Plugin 'ervandew/supertab'
"Plugin 'svermeulen/vim-easyclip'

Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'

Plugin 'AfterColors.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on
" }}}

language messages en
set showmode
set hidden
set foldmethod=syntax
set smartindent
set expandtab
set tabstop=4 expandtab shiftwidth=4
set formatoptions-=t
set wildmode=list:longest,full
set ignorecase
set smartcase
set number
set hlsearch
set wrap
set nobackup
set nowritebackup
set noswapfile
set mouse=a
set showmatch
set cursorline
set encoding=utf-8
set colorcolumn=100
set vb t_vb=
set nolist
set listchars=tab:▸–,trail:·,nbsp:¬

set pastetoggle=<F2>
nnoremap <silent> <F2> :set invpaste paste?<CR>
" Para siempre copiar del unnamed al * y viceversa
set clipboard=unnamed

" Color Scheme
colorscheme Tomorrow

set laststatus=2
set statusline=[%n]\ %f\ %m%y%r%h%w%{SL('fugitive#statusline')}%=%{&fenc==\"\"?&enc:&fenc}[%{&ff}]\ [%L,%p%%]\ [%l,%c%V]\ %P

" Para que inicie el pwd en ~
cd ~

" Para los .log
au BufRead,BufNewFile *.log set filetype=text

" Mappings {{{1
" Override defaults {{{2
let mapleader = ","
nnoremap Q <Nop>
nnoremap <space> za
nnoremap j gj
nnoremap k gk

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

" Visual line repeat {{{2 
xnoremap . :normal .<CR> 
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
 
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

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
silent! nnoremap <unique> <silent> <Leader>r :CtrlPMRUFiles<CR>
silent! nnoremap <unique> <silent> <Leader>o :CtrlPBookmarkDir<CR>
let g:ctrlp_custom_ignore = {
\ 'dir': '\.git$\|\.hg$\|\.svn$',
\ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
\ 'link': 'some_bad_symbolic_links',
\ }
let g:ctrlp_map = ''
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['bookmarkdir']
let g:ctrlp_working_path_mode = 0

let g:ctrlp_match_window='max:30'

call ctrlp_bdelete#init()

" Tabular {{{2
" Invoke by <leader>= alignment-character 
nnoremap <silent> <leader>= :call g:Tabular(1)<CR> 
xnoremap <silent> <leader>= :call g:Tabular(0)<CR> 
function! g:Tabular(ignore_range) range 
    let c = getchar() 
    let c = nr2char(c) 
    if a:ignore_range == 0 
        exec printf('%d,%dTabularize /%s', a:firstline, a:lastline, c) 
    else 
        exec printf('Tabularize /%s', c) 
    endif 
endfunction 

" EasyClip {{{2
"nmap <silent> gs <plug>SubstituteOverMotionMap
"nmap gss <plug>SubstituteLine
"xmap gs p
"let g:EasyClipUseCutDefaults = 0
"nmap x <Plug>MoveMotionPlug
"xmap x <Plug>MoveMotionXPlug
"nmap xx <Plug>MoveMotionLinePlug

" ag & ack.vim {{{2
let g:ackprg = 'C:\Users\eb75435\vimfiles\utils\ack -s -H --nogroup --nocolor --column'
nnoremap K :AckWindow! "\b<C-R><C-W>\b"<CR>
nnoremap \ :AckWindow!<Space>
nnoremap <Leader>a :Ack<Space>

" SuperTab {{{ 2
let g:SuperTabDefaultCompletitionType = '<c-n>'
let g:SuperTabContextDefaultCompletitionType = '<c-n>'


" Commands {{{1
" From tpope .vimrc
if has("eval")
function! SL(function)
    if exists('*'.a:function)
        return ' '.call(a:function,[])
    else
        return ''
    endif
endfunction
endif
