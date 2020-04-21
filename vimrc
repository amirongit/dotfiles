call plug#begin('~/.vim/plugged') 

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'tomasiser/vim-code-dark'
Plug 'ap/vim-css-color'
Plug 'maralla/completor.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'alvan/vim-closetag'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'ajh17/Spacegray.vim'

call plug#end()

:set number relativenumber
:set nocp
:set scrolloff=3
:set tabstop=4
:set expandtab
:set softtabstop=4
:set shiftwidth=4
:set bg=dark
:set autoindent
:set cindent
:set si
:set showmatch
:set ignorecase
:set noswapfile
:set encoding=utf-8
:set background=dark
:set t_Co=256
:set termguicolors
:set clipboard=unnamedplus
:set showmode

:let g:completor_python_binary = '/usr/bin/python3.8'
:let g:acp_behaviorKeywordLength = 1
:let g:indentLine_char = '┊'
:let g:completor_complete_options = 'menuone,noselect'

:syntax on
:colorscheme spacegray
:filetype plugin on

:map <S-f>                  :set hlsearch!<CR>

:inoremap <expr> <Tab>      pumvisible() ? "\<C-n>" : "\<Tab>"
:noremap <silent> <S-Tab>   :call completor#do('doc')<CR>

:nnoremap H                 gT
:nnoremap L                 gt

:nnoremap <S-Up>            :resize +2<CR>
:nnoremap <S-Down>          :resize -2<CR>
:nnoremap <S-Left>          :vertical resize +2<CR>
:nnoremap <S-Right>         :vertical resize -2<CR>

:xnoremap K                 :move '<-2<CR>gv-gv
:xnoremap J                 :move '>+1<CR>gv-gv

:autocmd BufWritePre *.*    :%s/\s\+$//e
:autocmd FileType python setlocal completeopt-=preview


" to make it work use  run :so $VIMRUNTIME/syntax/hitest.vim
:set statusline +=%#Title#
:set statusline +=\[%{mode()}]
:set statusline +=\[%F]
:set statusline +=\%r
:set statusline +=\%m
:set statusline +=%=
:set statusline +=\[buffer
:set statusline +=\ %n]
:set statusline +=\[column
:set statusline +=\ %v]
:set statusline +=\[line
:set statusline +=\ %l
:set statusline +=\ /
:set statusline +=\ %L]
:set statusline +=\[%Y]
