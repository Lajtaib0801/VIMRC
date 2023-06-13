call plug#begin()

Plug 'jacoborus/tender.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

map <C-o> :NERDTreeToggle<CR>
" colorscheme tender
colorscheme OceanicNext
set nu rnu
set mouse=a
set directory=$HOME/.cache/vim/swap// " required --> mkdir -p ~/.cache/vim/swap

set encoding=utf-8
set fileencoding=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

if has("gui_running")
    set guifont=Screen15,\ 10x20
endif
