syntax on
set tabstop=4 softtabstop=4
set shiftwidth=4
set autoindent
set autoread
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set relativenumber "Relative line numbers
set scrolloff=15 " Keep n=15 lines below and above the cursor

" set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:coc_node_path = '/usr/local/bin/node'
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'dart-lang/dart-vim-plugin'
Plug 'vim-autoformat/vim-autoformat'

call plug#end()

" Autoformat configuration
let g:formatters_python = ['black']
au BufWrite * :Autoformat

" Themes / colors
colorscheme gruvbox
set termguicolors

" Compilation commands (USACO legacy)
" autocmd filetype cpp nnoremap <C-c> :w <bar> exec '!xcrun clang++ -std=c++11 -stdlib=libc++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

filetype plugin on
filetype plugin indent on

if executable('rg')
	let g:rg_derive_root='true'
endif

if has("autocmd")
	augroup templates autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
	augroup END
endif

let mapleader = " "

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_use_caching = 0

" coc.nvim tab to autocomplete
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" --- Normal mode commands --- START
"Movements -> visual movements
noremap j gj
noremap k gk
noremap $ g$
"Remaps z key to 'find backward' key
noremap z F
" --- Normal mode commands --- END

let mapleader=","
inoremap qp <ESC>

"Copies file contents directly to system keyboard
noremap <C-k> :%w !pbcopy<CR>

" Convenience command to create terminal on the bottom of the current window
command Term below terminal ++rows=5
command C echo col('.')

" Allows the mouse to be used in terminal VIM.
set mouse=a

" NerdTree stuff:
" autocmd vimenter * NERDTree | wincmd p
map <C-n> :NERDTreeToggle<CR>

:set wrap linebreak nolist

" Automatic commands
" :autocmd BufWritePost *.dart silent !~/Programming/flutter/bin/flutter format <afile>

