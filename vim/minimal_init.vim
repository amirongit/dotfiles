call plug#begin('~/.vim/plugged')
Plug 'dracula/vim'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'jaredgorski/SpaceCamp'
Plug 'cocopon/iceberg.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'nanotech/jellybeans.vim'
call plug#end()

let g:netrw_banner = 0
let gruvbox_contrast_dark = 'hard'

xmap <silent><silent>K    :move '<-2<CR>gv-gv
xmap <silent><silent>J    :move '>+1<CR>gv-gv

nmap <silent><Down>               :resize +2<CR>
nmap <silent><Up>                 :resize -2<CR>
nmap <silent><Left>               :vertical resize +2<CR>
nmap <silent><Right>              :vertical resize -2<CR>
nmap <silent>J                    <Plug>(coc-diagnostic-next)
nmap <silent>K                    <Plug>(coc-diagnostic-prev)
nmap q                            <NOP>
nmap Q                            <NOP>
nmap H                            gT
nmap L                            gt
nmap <silent><leader>sex          :Sexplore<CR>
nmap <silent><leader>vex          :Vexplore<CR>
nmap <silent><leader>tex          :Texplore<CR>
nmap <silent><leader>exp          :Explore<CR>
nmap <silent><leader>hls          :set hlsearch!<CR>

set nobackup
set shortmess=aFc
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

set listchars=trail:⋅,space:⋅,eol:¬,tab:→\ ,extends:❯,precedes:❮
"set listchars=trail:.,space:.,eol:$
"set listchars=
set cmdheight=2
set showtabline=2
set scrolloff=0
set clipboard=unnamed,unnamedplus
set tabstop=4
set softtabstop=4
set shiftwidth=4
set background=dark
set encoding=utf-8
set updatecount=0
set wildmode=list:longest,list:full
set t_Co=256
set foldmethod=indent
set foldlevelstart=0
set foldnestmax=20
set foldlevel=1
set nofoldenable
set pastetoggle=<leader>p
set backspace=indent,eol,start
set laststatus=2
set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:block
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guifont=Ubuntu\ mono\ 13
set updatetime=300
set signcolumn=yes
set termguicolors

"appearance
syntax on
colorscheme codedark
hi clear SignColumn
hi clear LineNr
hi SignColumn guibg=bg ctermbg=bg
hi EndOfBuffer ctermfg=bg ctermbg=bg guifg=bg guibg=bg
hi EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
hi DiffAdd ctermbg=None ctermfg=white cterm=bold guibg=None guifg=white gui=bold
hi DiffChange ctermbg=None ctermfg=white cterm=bold guibg=None guifg=white gui=bold
hi DiffDelete ctermbg=None ctermfg=white cterm=bold guibg=None guifg=white gui=bold
hi CocWarningSign ctermfg=white cterm=bold guifg=white gui=bold
hi CocErrorSign ctermfg=white cterm=bold guifg=white gui=bold
hi CocHintSign ctermfg=white cterm=bold guifg=white gui=bold
hi clear PmenuThumb
hi clear PmenuSbar
hi Pmenu ctermbg=black ctermfg=white guibg=black guifg=white

"statusline
"so $VIMRUNTIME/syntax/hitest.vim
set statusline +=%#ModeMsg#
set statusline +=\ %{mode()}
set statusline +=\ %B 
set statusline +=\ %F 
set statusline +=\ %M
set statusline +=\ %R
set statusline +=%=
set statusline +=\ %v
set statusline +=\ %Y
