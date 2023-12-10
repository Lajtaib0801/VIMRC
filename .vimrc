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
    Plug 'prabirshrestha/async.vim'
    "Plug 'leafgarland/typescript-vim' " TypeScript syntax
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'rhysd/vim-clang-format'

    call plug#end()
    let g:coc_global_extensions = ['coc-tsserver']
    map <C-o> :NERDTreeToggle<CR>
    map <C-f> :Files<CR>
    map <C-t> :tabnew<CR>
    map <C-w> :tabclose<CR>
    map <C-Right> :tabnext<CR>
    map <C-Left> :tabprevious<CR>
    map <C-S> :Ag 
    nmap <C-CR>  <Plug>(coc-codeaction)
    " colorscheme tender
    colorscheme OceanicNext
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif
    nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>

    set directory=$HOME/.cache/vim/swap// " required --> mkdir -p ~/.cache/vim/swap
endif
