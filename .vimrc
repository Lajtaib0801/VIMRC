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
au BufReadPost *.s set ft=gas "https://github.com/Shirk/vim-gas needed!
au BufReadPost *.asm set ft=nasm

if has("gui_running")
    " set guifont=Screen15,\ 10x20 "for minimal vim
    set guifont=Ubuntu\ Mono\ 14
    set guioptions -=T
else
    call plug#begin()

    Plug 'jacoborus/tender.vim'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    call plug#end()

    map <C-o> :NERDTreeToggle<CR>
    " colorscheme tender
    colorscheme OceanicNext
    set directory=$HOME/.cache/vim/swap// " required --> mkdir -p ~/.cache/vim/swap
endif
