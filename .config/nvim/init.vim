"-- General Options --
syntax on

set noerrorbells
set encoding=UTF-8
set number relativenumber
set spelllang=en_us
set autoindent
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set hls is
set laststatus=2
set cmdheight=1
set noic
set wildmenu

"-- Key Remaps --
map <C-s> :set spell!<CR>

nnoremap <C-f> :NERDTreeToggle <CR>
nnoremap <esc> :noh<CR>
nnoremap <C-u> :UndotreeToggle <CR>
nmap <C-_> <plug>NERDCommenterToggle

xnoremap <C-Up> :move '<-2<CR>gv-gv
xnoremap <C-Down> :move '>+1<CR>gv-gv

"-- Plugs --
call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'mbbill/undotree'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree'
    Plug 'valloric/youcompleteme'
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin on
colorscheme gruvbox
set background=dark
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

