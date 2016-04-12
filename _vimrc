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
Plugin 'dpc/vim-smarttabs'
Plugin 'junegunn/vim-easy-align'

" file stuff
Plugin 'tpope/vim-vinegar' " netrw wrapper
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'pangloss/vim-javascript'
Plugin 'bigfish/vim-js-context-coloring'

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

set relativenumber


" set scrolloff=30 
" ugh yml
au BufRead,BufNewFile *.yml setlocal ft=yaml sts=2 ts=2 sw=2 et


augroup csharp
	autocmd FileType cs let @h="O/// <summary>\<CR>\<CR></summary>\<C-c>"
	autocmd Filetype cs let @p="\"_yiwO/// \<C-c>\"_p"
augroup end

augroup javadoc
	autocmd BufRead,BufNewFile *.java,*.js let @h="O/**\<CR>\<CR>/\<C-c>"
augroup end

nmap <S-Space> <Leader>
omap <S-Space> <Leader>
nmap <Space> :

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nmap <Leader>l :set relativenumber!<CR>
map <Leader>c :CtrlP $PVC<CR>
map <Leader>s :CtrlP $PVS<CR>
map <Leader>a :CtrlP $PVA<CR>
map <Leader>t :CtrlP $PVT<CR>

" easy motion
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

nnoremap <Leader>d "_d
nnoremap <Leader>p "_p

nmap <Leader>w :set list!<CR>

" manip vimrc
map <Leader>ve :e ~/.vimrc<CR>
map <Leader>vs :source ~/.vimrc<CR>

nmap <Leader>bd :bd *<C-a><CR>
nmap <Leader>x :JSContextColorToggle<CR>


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
let g:js_context_colors_enabled = 1
let g:js_context_colors_fold = 0

" toggle visible whitespace
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<



set wildignore+=*/node_modules/*,*/.git/*,*.so,*.swp,*.*.meta,*/Temp/*,*.class,*.*.meta
if has('gui_running')
	" set guifont=Consolas:h14,Sauce\ Code\ Powerline:h13
	set guifont=Sauce\ Code\ Powerline:h14
end

" syntastic
let g:syntastic_check_on_open = 0 

" CtrlP
let g:ctrlp_working_path_mode = 'r'
map <Leader>P :CtrlP 

" powerline
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarized256'

let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)'}

if executable('ag')
	let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
		  \ --ignore .git
		  \ --ignore .svn
		  \ --ignore .hg
		  \ --ignore .DS_Store
		  \ --ignore "**/*.pyc"
		  \ --ignore "**/target/**"
		  \ --ignore "*.*.meta"
		  \ --ignore "*.meta"
		  \ -g ""'
endif
" omnisharp
set splitbelow
imap <Leader>o <C-x><C-o>
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>ff :OmniSharpCodeFormat<cr>
augroup omnisharp_commands
	autocmd!

	autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

	autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
	autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
	autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
	autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
	autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
	autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
	autocmd FileType cs nnoremap <leader>fd :OmniSharpDocumentation<cr>
	
augroup END

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_at_startup = 0
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

" inoremap<expr><Space> pumvisible() ? neocomplete#close_popup()."\<SPACE>" : "\<SPACE>"

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

let g:neocomplete#sources#omni#input_patterns.cs = '[a-zA-Z0-9_]\+'
let g:neocomplete#sources.cs = ['omni']
let g:neocomplete#enable_refresh_always = 0
let g:echodoc_enable_at_startup = 1



map <C-s> <Plug>(easymotion-s)

nmap ]c <Plug>GitGutterNextHunk
nmap [c <Plug>GitGutterPrevHunk

noremap <F7> :g/\s\+\w\+\s*:\s*function/p<CR>
noremap <F2> :redir@y<CR>:g/<C-r><C-w>/p<CR>:vsplit<CR><C-W>l:enew<CR>:put! y<CR>

" vim: set ft=vim :
set nobackup
set nowritebackup

function! JSON()
	:%!python -m json.tool
	%s/    /\t/g
endfunction

command! JSON call JSON()


" dbtext
" let g:dbext_default_profile_mysql = 'type=MYSQL:user=root:passwd=kchiusql:dbname=darkheroes_game' 
