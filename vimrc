call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'Yggdroot/indentLine'
Plug 'tomasiser/vim-code-dark'
Plug 'ap/vim-css-color'
Plug 'maralla/completor.vim'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-startify'
Plug 'arcticicestudio/nord-vim'
Plug 'mcchrish/nnn.vim'
Plug 'airblade/vim-gitgutter'
Plug 'wincent/terminus'
call plug#end()

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '[0W 0E]' : printf(
    \   '[%dW %dE]',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('[+%d ~%d -%d]', a, m, r)
endfunction

set number relativenumber
set nocp
set scrolloff=3
set updatetime=100
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set bg=dark
set ignorecase
set noswapfile
set encoding=utf-8
set background=dark
set t_Co=256
set completeopt=longest,menuone
set noshowmode
set noshowcmd
set shortmess+=F

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
set statusline +=%{LinterStatus()}
set statusline +=%{GitStatus()}

let g:completor_python_binary = '/usr/bin/python'
let g:completor_gocode_binary = '/home/amir/go/bin/gocode'
let g:completor_complete_options = 'menuone,noselect'
let g:indentLine_char = '┆'
let g:ale_linters = {'python': ['pycodestyle'], 'go': ['golint']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:nnn#layout = 'tabnew'
let g:nnn#action = {'<S-t>': 'tab split'}
let g:startify_lists = [
        \ {'type': 'files','header': ['        Last Buffers']},
        \ {'type': 'sessions','header': ['        Sessions']},
        \ {'type': function('s:gitModified'),  'header': ['        Modified']},
        \ {'type': function('s:gitUntracked'), 'header': ['        New']},
        \ ]
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_async = 1
let g:gitgutter_grep = ''
let g:gitgutter_terminal_reports_focus = 0
let g:TerminusCursorShape = 0
let g:indentLine_setConceal = 0


highlight clear ALEErrorSign
highlight clear ALEWarningSign
syntax on
colorscheme nord
filetype plugin on

inoremap <expr> <Tab>       pumvisible() ? "\<C-n>" : "\<Tab>"
noremap  <leader>d          :call completor#do('doc')<CR>
nnoremap <leader>n          :NnnPicker '%:p:h'<CR>
nnoremap <leader>h          :set hlsearch!<CR>
nnoremap q                  <NOP>

nnoremap H                 gT
nnoremap L                 gt

nnoremap <S-Up>            :resize +2<CR>
nnoremap <S-Down>          :resize -2<CR>
nnoremap <S-Left>          :vertical resize +2<CR>
nnoremap <S-Right>         :vertical resize -2<CR>

xnoremap K                 :move '<-2<CR>gv-gv
xnoremap J                 :move '>+1<CR>gv-gv
