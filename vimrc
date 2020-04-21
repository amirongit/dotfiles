call plug#begin('~/.vim/plugged') 

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tomasiser/vim-code-dark'
Plug 'ap/vim-css-color'
Plug 'maralla/completor.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'alvan/vim-closetag'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'dense-analysis/ale'
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

:let g:airline_left_sep = ''
:let g:airline_right_sep = ''
:let g:completor_python_binary = '/usr/bin/python3.8'
:let g:acp_behaviorKeywordLength = 1
:let g:airline_theme = 'minimalist'
:let g:airline_powerline_fonts = 1
:let g:airline_extensions = ['tabline', 'ale'] 
:let g:indentLine_char = '┊'
:let g:completor_complete_options = 'menuone,noselect'
:let g:ale_pattern_options = {'\.py': {'ale_linters': ['pycodestyle']}}
:let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
:let g:ale_sign_error = 'E'
:let g:ale_sign_warning = 'W'
:let g:ale_echo_msg_error_str = 'E'
:let g:ale_echo_msg_warning_str = 'W'
:let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

:syntax on
:colorscheme spacegray
:filetype plugin on
:highlight clear ALEWarningSign

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
