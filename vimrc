call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'
Plug 'tomasiser/vim-code-dark'
Plug 'ap/vim-css-color'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'maralla/completor.vim'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-startify'
Plug 'arcticicestudio/nord-vim'

call plug#end()

set number relativenumber
set nocp
set scrolloff=3
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set bg=dark
set autoindent
set cindent
set si
set showmatch
set ignorecase
set noswapfile
set encoding=utf-8
set background=dark
set t_Co=256
set termguicolors
set clipboard=unnamedplus
set showmode
set completeopt=longest,menuone

" run :so $VIMRUNTIME/syntax/hitest.vim
set statusline +=%#Title#
set statusline +=\[%{mode()}]
set statusline +=\[%F]
set statusline +=\%r
set statusline +=\%m
set statusline +=%=
set statusline +=\[buffer
set statusline +=\ %n]
set statusline +=\[column
set statusline +=\ %v]
set statusline +=\[line
set statusline +=\ %l
set statusline +=\ /
set statusline +=\ %L]
set statusline +=\[%Y]

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction


let g:completor_python_binary = '/usr/bin/python3.8'
let g:completor_gocode_binary = '/home/amir/go/bin/gocode'
let g:completor_complete_options = 'menuone,noselect'
let g:indentLine_char = '┆'
let g:ale_linters = {'python': ['pycodestyle'], 'go': ['golint']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:startify_lists = [
        \ { 'type': 'files','header': ['Last Buffers']},
        \ { 'type': 'sessions','header': ['Sessions']},
        \ { 'type': function('s:gitModified'),  'header': ['Modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['New']},
        \ ]

highlight clear ALEErrorSign
highlight clear ALEWarningSign
syntax on
colorscheme nord
filetype plugin on

map <S-f>                  :set hlsearch!<CR>

inoremap <expr> <Tab>      pumvisible() ? "\<C-n>" : "\<Tab>"
noremap <silent> <S-Tab>   :call completor#do('doc')<CR>

nnoremap H                 gT
nnoremap L                 gt

nnoremap <S-Up>            :resize +2<CR>
nnoremap <S-Down>          :resize -2<CR>
nnoremap <S-Left>          :vertical resize +2<CR>
nnoremap <S-Right>         :vertical resize -2<CR>

xnoremap K                 :move '<-2<CR>gv-gv
xnoremap J                 :move '>+1<CR>gv-gv
