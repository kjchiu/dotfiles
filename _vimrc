set nocompatible
set rtp+=~/.vim/bundle/vundle

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-vinegar'

" langs
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'

" themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
call vundle#end()


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
  " colorscheme solarized
  colorscheme molokai
else
  colorscheme default
endif


map <S-Space> <Leader>
nmap <Space> :

" manip vimrc
silent map <Leader>ev :e ~/.vimrc<CR>
silent map <Leader>sv :source ~/.vimrc<CR>

nmap <Leader>bd :bd *<C-a><CR>

set wildignore+=*/node_modules/*,*/.git/*,*.so,*.swp
if has('gui_running')
	set guifont=Sauce\ Code\ Powerline:h13
end

" CtrlP
let g:ctrlp_working_path_mode = 'r'
map <Leader>c :CtrlP $DHC<CR>
map <Leader>s :CtrlP $DHS<CR>
map <Leader>P :CtrlP 

" powerline
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarized256'

let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)'}

" easy motion
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <C-s> <Plug>(easymotion-s)


noremap <F7> :g/\s\+\w\+\s*:\s*function/p<CR>

" vim: set ft=vim :
set nobackup
set nowritebackup
