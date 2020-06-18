call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'tomasiser/vim-code-dark'
Plug 'ap/vim-css-color'
Plug 'maralla/completor.vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'wincent/terminus'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
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
set hidden
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
set laststatus=2

" so $VIMRUNTIME/syntax/hitest.vim
set statusline +=%#Question#
set statusline +=\[%{mode()}]
set statusline +=\[%F]
set statusline +=\%r
set statusline +=\%m
set statusline +=%=
set statusline +=\[%v]
set statusline +=\[%Y]
set statusline +=%{LinterStatus()}
set statusline +=%{GitStatus()}

let g:completor_python_binary = '/usr/bin/python'
let g:completor_clang_binary = '/usr/bin/clang'
let g:completor_filetype_map = {}
let g:completor_filetype_map.rust = {'ft': 'lsp', 'cmd': 'rls'}
let g:completor_complete_options = 'menuone,noselect'
let g:ale_linters = {'python': ['pycodestyle'], 'rust': ['rustc']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
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
let g:indentLine_char = '┆'

highlight clear ALEErrorSign
highlight clear ALEWarningSign
syntax on
colorscheme codedark
filetype plugin on

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>hls  :set hlsearch!<CR>
nnoremap <leader>gen  :!ctags -R<CR>

nnoremap <leader>exp  :Files!
nnoremap <leader>his  :History!<CR>
nnoremap <leader>gfi  :GFiles!<CR>
nnoremap <leader>sta  :GFiles?<CR>
nnoremap <leader>lin  :Lines!<CR>
nnoremap <leader>tag  :Tags!<CR>
nnoremap <leader>com  :Commits!<CR>

noremap  <leader>doc  :call completor#do('doc')<CR>
nnoremap <leader>def  :call completor#do('definition')<CR>


nnoremap q          <NOP>
nnoremap J          <NOP>
nnoremap K          <NOP>

nnoremap H          gT
nnoremap L          gt

nnoremap zz         <C-^>

nnoremap <S-Down>   :resize +2<CR>
nnoremap <S-Up>     :resize -2<CR>
nnoremap <S-Left>   :vertical resize +2<CR>
nnoremap <S-Right>  :vertical resize -2<CR>

xnoremap K          :move '<-2<CR>gv-gv
xnoremap J          :move '>+1<CR>gv-gv
