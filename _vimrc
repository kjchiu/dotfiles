call pathogen#infect()

set shiftwidth=2
set tabstop=2
set expandtab
set nu
set ic
set autoindent
set smartindent
set wmh=0
set nowrap

set backspace=indent,eol,start

set incsearch
set hlsearch

syntax on
filetype on
set guifont=Consolas:h10:cANSI
set background=dark
colorscheme solarized


nmap <C-V> "+gP
map ; :
map <S-Space> <Leader>

" manip vimrc
silent map <Leader>ev :e d:\utilities\vim\_vimrc<CR>
silent map <Leader>sv :source d:\utilities\vim\_vimrc<CR>

set wildignore+=*/node_modules/*,*/.git/*,*.so,*.swp
"CtrlP
map <Leader>p :CtrlP<CR>
map <Leader>P :CtrlP 
let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)'}


" vim: set ft=vim :
set nobackup
set nowritebackup
set noswapfile
