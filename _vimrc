set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
filetype off

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'

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

" omnisharp + deps
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/syntastic'
Plugin 'Omnisharp/omnisharp-vim'

Plugin 'Shougo/neocomplete.vim'

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

" toggle visible whitespace
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nmap <Leader>w :set list!<CR>

" manip vimrc
silent map <Leader>ev :e ~/.vimrc<CR>
silent map <Leader>sv :source ~/.vimrc<CR>

nmap <Leader>bd :bd *<C-a><CR>

set wildignore+=*/node_modules/*,*/.git/*,*.so,*.swp,*.*.meta,*/Temp/*
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

" omnisharp
set splitbelow
imap <Leader>o <C-x><C-o>
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
augroup omnisharp_commands
	autocmd!

	autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

	autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
	autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
	autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
	autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
	autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
	autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
	
augroup END

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Don't Use smartcase.
let g:neocomplete#enable_smart_case = 0
let g:neocomplete#enable_auto_close_preview = 0
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist'
        \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

let g:neocomplete#enable_auto_select = 0
let g:neocomplete#disable_auto_complete = 0

" Enable heavy omni completion.

call neocomplete#custom#source('_', 'sorters', [])

if !exists('g:neocomplete#sources')
        let g:neocomplete#sources = {}
endif

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
let g:neocomplete#sources.cs = ['omni']
let g:neocomplete#enable_refresh_always = 0
let g:echodoc_enable_at_startup = 1


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

map <Leader>c :CtrlP $YMC<CR>
map <Leader>s :CtrlP $YMS<CR>

function! JSON()
	:%!python -m json.tool
	%s/    /\t/g
endfunction

command! JSON call JSON()


" dbtext
" let g:dbext_default_profile_mysql = 'type=MYSQL:user=root:passwd=kchiusql:dbname=darkheroes_game' 
