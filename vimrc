set nocompatible
filetype off

set noshowmode
set number
set showcmd
set ruler
set noswapfile
set nobackup
set nowb
set nowrap
set linebreak

"Search
set ignorecase
set hlsearch
set incsearch

"Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

"Shows the status bar (on default shown after split)
set laststatus=2

"Prevents a pause when leaving insert mode
set timeoutlen=50

set t_Co=256
syntax on
set background=dark
colorscheme jellybeans

"Underlines the current line in insert mode
"autocmd InsertEnter * set cul
"autocmd InsertLeave * set nocul

set colorcolumn=80
highlight ColorColumn ctermbg=233

"Mappings
let mapleader=","

"Clean search highlighting on escape
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

"Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"Base plugin, required
Plugin 'VundleVim/Vundle.vim'

"Custom plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'justmao945/vim-clang'

call vundle#end()
filetype plugin indent on

"Plugins configuration

"NERDTree
map <C-n> :NERDTreeToggle<CR>

"vim-airline
let g:airline_powerline_fonts = 1

"Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

if !exists('g:neocomplete#force_omni_input_patterns')
   let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.c =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

"vim-clang
let g:clang_auto = 0
