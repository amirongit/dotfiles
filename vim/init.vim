let g:netrw_banner = 0
let g:netrw_liststyle = 3

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
if (has("termguicolors"))
  set termguicolors
endif

xmap <silent><silent>K    :move '<-2<CR>gv-gv
xmap <silent><silent>J    :move '>+1<CR>gv-gv
nmap q                    <NOP>
nmap Q                    <NOP>
nmap H                    gT
nmap L                    gt
nmap <silent><leader>sex  :Sexplore<CR>
nmap <silent><leader>vex  :Vexplore<CR>
nmap <silent><leader>tex  :Texplore<CR>
nmap <silent><leader>exp  :Explore<CR>
nmap <silent><leader>hls  :set hlsearch!<CR>

set nocompatible
set cursorline
" set undofile
" set undodir=~/Development/.nvim-cache
set nobackup
set hidden
set nowritebackup
set noswapfile
set expandtab
set shiftround
set smarttab
set autoindent
set list
set splitbelow
set nocp
set number relativenumber
set ignorecase
set smartcase
set incsearch
set autoread
set showmatch
set noshowmode
set noruler
set noshowcmd
set wrap
set linebreak
set termguicolors
set mouse=
set listchars=trail:⋅,space:⋅,eol:¬,tab:→\ ,extends:❯,precedes:❮
" set listchars=trail:.,space:.,eol:$
" set listchars=
set cmdheight=2
set showtabline=0
set scrolloff=0
" set clipboard=unnamed,unnamedplus
set clipboard+=unnamedplus
set tabstop=4
set softtabstop=4
set shiftwidth=4
set background=dark
set encoding=utf-8
set updatecount=0
set wildmode=list:longest,list:full
set t_Co=256
set foldmethod=indent
set foldlevelstart=1
set foldnestmax=5
set foldlevel=1
set nofoldenable
set pastetoggle=<leader>p
set backspace=indent,eol,start
set shortmess=
set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:block
set updatetime=300
set signcolumn=number
set laststatus=2
" set colorcolumn=120

syntax on
