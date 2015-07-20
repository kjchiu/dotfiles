set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
filetype off

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-multiple-cursors'

" file stuff
Plugin 'tpope/vim-vinegar' " netrw wrapper
Plugin 'kien/ctrlp.vim'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'pangloss/vim-javascript'

" clojure
Plugin 'oblitum/rainbow' " rainbow parens
Plugin 'guns/vim-clojure-highlight'
Plugin 'tpope/vim-fireplace' " clojure repl

" themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'queyenth/oxeded.vim'
call vundle#end()
filetype plugin indent on


" ugh yml
au BufRead,BufNewFile *.yml setlocal ft=yaml sts=2 ts=2 sw=2 et

set noswapfile

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

" set scrolloff=30 

" macros

" vim why can't i use let with chords :(
"let @t='yiwIvar <C-o>A = require(''thor/<C-r>"'');o<C-c>'
"let @r='yiwIvar <C-o>A = require('./<C-r>"');o<C-c>';

"let @h='O/** **/qkb'

syntax on
filetype on
set background=light
if has("gui_running")
  " colorscheme solarized
  colorscheme molokai
else
  colorscheme default
endif

let g:rainbow_active = 1

nmap <S-Space> <Leader>
omap <S-Space> <Leader>
nmap <Space> :
nmap <Leader>d "_d
nmap <Leader>p "_p
imap <C-CR> <C-o>A;<C-c>:s/\([,{]\);$/\1/e<CR>:s/;\+$/;/e<CR>o
nmap <C-CR> A;<C-c>:s/\([,{]\);$/\1/e<CR>:s/;\+$/;/e<CR>o<C-c>

"asdf,

" toggle visible whitespace
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nmap <Leader>w :set list!<CR>

" manip vimrc
silent map <Leader>ev :e ~/.vimrc<CR>
silent map <Leader>sv :source ~/.vimrc<CR>

nmap <Leader>bd :bd *<C-a><CR>

set wildignore+=*/node_modules/*,*/.git/*,*.so,*.swp
if has('gui_running')
	set guifont=Consolas:h14,Sauce\ Code\ Powerline:h13
end

" CtrlP
let g:ctrlp_working_path_mode = 'r'
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

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk


noremap <F7> :g/\s\+\w\+\s*:\s*function/p<CR>
noremap <F2> :redir@y<CR>:g/<C-r><C-w>/p<CR>:vsplit<CR><C-W>l:enew<CR>:put! y<CR>

" vim: set ft=vim :
set nobackup
set nowritebackup

map <Leader>c :CtrlP $DHC<CR>
map <Leader>s :CtrlP $DHS<CR>
map <Leader>t :CtrlP $DHT<CR>

function! JSON()
	:%!python -m json.tool
	%s/    /\t/g
endfunction

command! JSON call JSON()


" dbtext
" let g:dbext_default_profile_mysql = 'type=MYSQL:user=root:passwd=kchiusql:dbname=darkheroes_game' 
