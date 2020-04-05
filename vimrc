call plug#begin('~/.vim/plugged') 

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tomasiser/vim-code-dark'
Plug 'jaredgorski/spacecamp'
Plug 'ap/vim-css-color'
Plug 'maralla/completor.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

:set number relativenumber
:set nocp
:set tabstop=4
:set expandtab
:set softtabstop=4
:set shiftwidth=4
:set bg=dark
:set ls=2
:set clipboard=unnamedplus
:set autoindent
:set cindent
:set si
:set showmatch
:set hlsearch
:set ignorecase
:set noswapfile
:set mouse=a
:set pastetoggle=<C-p>
:set encoding=utf-8
:set background=dark
:set t_Co=256
:set termguicolors
:set hlsearch!
:set lazyredraw
:set hidden
:set clipboard=unnamedplus
:set nocompatible
:set backspace=indent,eol,start


:let g:airline_left_sep = ''
:let g:airline_right_sep = ''
:let g:completor_python_binary = '/usr/bin/python3.8'
:let g:acp_behaviorKeywordLength = 1
:let g:airline_theme = 'dracula'
:let g:airline_powerline_fonts = 1
:let g:airline_extensions = ['tabline', 'branch'] 
:let g:indentLine_char = '┊'
:let g:onedark_termcolors = 16

:syntax on
:colorscheme dracula
:filetype plugin on

:map <C-f> :set hlsearch!<CR>

:tnoremap <Esc> <C-\><C-n>

:nnoremap <S-h> gT
:nnoremap <S-l> gt

:nnoremap <Down> <C-W>j
:nnoremap <Up> <C-W>k
:nnoremap <Right> <C-W>l
:nnoremap <Left> <C-W>h

:autocmd BufWritePre *.* :%s/\s\+$//e
:autocmd FileType python set sw=4
:autocmd FileType python set ts=4
:autocmd FileType python set sts=4
:autocmd FileType python setlocal completeopt-=preview
