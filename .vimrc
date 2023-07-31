set nu rnu
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
"for windows terminal the following two:
"let &t_SI="\e[2 q"
"let &t_EI="\e[2 q"
syntax on

if has("gui_running")
    " set guifont=Screen15,\ 10x20 "for minimal vim
    set guifont=Ubuntu\ Mono\ 14
else
    call plug#begin()

    Plug 'jacoborus/tender.vim'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

    call plug#end()

    map <C-o> :NERDTreeToggle<CR>
    " colorscheme tender
    colorscheme OceanicNext
    set directory=$HOME/.cache/vim/swap// " required --> mkdir -p ~/.cache/vim/swap
endif
