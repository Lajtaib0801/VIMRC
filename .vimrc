set nu
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
"for windows terminal the following three:
"let &t_SI="\e[2 q"
"let &t_EI="\e[2 q"
"set ttymouse=sgr
"in windows terminal if backspace does not work
"set backspace=indent,eol,start
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
    Plug 'prabirshrestha/async.vim'
    Plug 'rhysd/vim-clang-format'
    Plug 'vim-scripts/AutoComplPop'
    Plug 'ycm-core/YouCompleteMe'
    " For ycm -> in ~/.vim/plugged the python3 install script should be ran, but for that the python3-dev package should be installed because of headers, and cmake aswell
    call plug#end()
    map <C-o> :NERDTreeToggle<CR>
    map <C-f> :Files<CR>
    map <C-t> :tabnew<CR>
    map <C-w> :tabclose<CR>
    map <C-Right> :tabnext<CR>
    map <C-Left> :tabprevious<CR>
    map <C-S> :Ag
    inoremap <C-@> <C-n>
    inoremap <C-S-@> <C-p>
    nnoremap <M-Up> :m-2<CR>==
    nnoremap <M-Down> :m+<CR>==
    vnoremap <M-Up> :m-2<CR>gv=gv
    vnoremap <M-Down> :m'>+<CR>gv=gv
    nnoremap <S-M-Up> :resize +2<CR>
    nnoremap <S-M-Down> :resize -2<CR>
    nnoremap <S-M-Left> :vertical resize -2<CR>
    nnoremap <S-M-Right> :vertical resize +2<CR>
    " colorscheme tender
    " colorscheme meta5
    colorscheme OceanicNext

    set directory=$HOME/.cache/vim/swap// " required --> mkdir -p ~/.cache/vim/swap
endif

function! OpenVTerm()
    rightbelow vsplit | terminal
    if winnr('j') != winnr()
        wincmd j
        close
    else
        echo "No windows below to close"
    endif
endfunction

function! OpenTerm()
    belowright terminal
endfunction

command! VTerm call OpenVTerm()
command! Term call OpenTerm()
