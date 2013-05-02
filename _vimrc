call pathogen#infect()

set nocompatible
set laststatus=2
set encoding=utf-8

set autochdir

set t_Co=256
set shiftwidth=4
set tabstop=4
set nu
set ic
set autoindent
set smartindent
set wmh=0
set nowrap

set incsearch
set hlsearch
set scrolloff=30 

syntax on
filetype on
set background=dark
if has("gui_running")
  colorscheme solarized
else
  colorscheme default
endif


map <S-Space> <Leader>
nmap <Space> :
nmap <Leader>/ :NERDTreeToggle<CR>

" manip vimrc
silent map <Leader>ev :e ~/.vimrc<CR>
silent map <Leader>sv :source ~/.vimrc<CR>

set wildignore+=*/node_modules/*,*/.git/*,*.so,*.swp

" CtrlP
let g:ctrlp_working_path_mode = 'r'
map <Leader>c :CtrlP $TKC<CR>
map <Leader>s :CtrlP $TKS<CR>
map <Leader>P :CtrlP 

" powerline
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarized256'

let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)'}


noremap <F7> :g/\s\+\w\+\s*:\s*function/p<CR>

" vim: set ft=vim :
set nobackup
set nowritebackup
