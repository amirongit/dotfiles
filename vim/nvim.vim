call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jaredgorski/spacecamp'
Plug 'nanotech/jellybeans.vim'
Plug 'neoclide/coc.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'mattn/emmet-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
call plug#end()

set nobackup
set nowritebackup
set cmdheight=2
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent><leader>def  <Plug>(coc-definition)
nmap <silent><leader>doc  :call<SID>show_documentation()<CR>
nmap <silent><leader>dn  <Plug>(coc-diagnostic-prev)
nmap <silent><leader>dp  <Plug>(coc-diagnostic-next)
nnoremap <silent><leader>dis  :<C-u>CocList diagnostics<cr>
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, '0') . ' ' . get(g:, 'coc_status', '')
endfunction
let g:coc_status_error_sign = 'E'
let g:coc_status_warning_sign = 'W'

let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_install_global = 0
autocmd FileType html EmmetInstall

" ['|', '¦', '┆', '┊']
let g:indentLine_char='|'
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='·'


nnoremap <silent><leader>his  :History!<CR>
nnoremap <silent><leader>gfi  :GFiles!<CR>
nnoremap <silent><leader>sta  :GFiles!?<CR>
nnoremap <silent><leader>lin  :Lines!<CR>
nnoremap <silent><leader>tag  :Tags!<CR>
nnoremap <silent><leader>com  :Commits!<CR>

xnoremap <silent>K          :move '<-2<CR>gv-gv
xnoremap <silent>J          :move '>+1<CR>gv-gv
nnoremap <silent><Down>   :resize +2<CR>
nnoremap <silent><Up>     :resize -2<CR>
nnoremap <silent><Left>   :vertical resize +2<CR>
nnoremap <silent><Right>  :vertical resize -2<CR>
nnoremap Q          <NOP>
nnoremap J          <NOP>
nnoremap K          <NOP>
nnoremap H          gT
nnoremap L          gt
nnoremap <silent><leader>rtl  :set rl!<CR>
nnoremap <silent><leader>sex  :Sexplore<CR>
nnoremap <silent><leader>vex  :Vexplore<CR>
nnoremap <silent><leader>tex  :Texplore<CR>
nnoremap <silent><leader>exp  :Explore<CR>
nnoremap <silent><leader>pas  "+gP
nnoremap <silent><leader>hls  :set hlsearch!<CR>
tmap <silent><ESC>            <C-\><C-n>
set listchars=eol:$,trail:·
set list
set number relativenumber
set scrolloff=1
set splitbelow
set nocp
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set background=dark
set ignorecase
set incsearch
set noswapfile
set encoding=utf-8
set t_Co=256
set t_ut=
set foldmethod=indent
set laststatus=2
set nofoldenable
set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:block
set updatetime=100
set signcolumn=yes
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
syntax on
let g:dracula_colorterm = 0
let g:codedark_conservative = 0
let g:gruvbox_contrast_dark = 'hard'
colorscheme base16-default-dark
highlight clear SignColumn
highlight clear LineNr
highlight SignColumn guibg=bg ctermbg=bg
highlight EndOfBuffer ctermfg=bg ctermbg=bg


" so $VIMRUNTIME/syntax/hitest.vim
set statusline +=%#ModeMsg#
set statusline +=\ %{mode()}
set statusline +=%#MoreMsg#
set statusline +=\ %B 
set statusline +=%#Directory#
set statusline +=\ %F 
set statusline +=%#VisualNOS#
set statusline +=\ %M
set statusline +=%#VisualNOS#
set statusline +=\ %R
set statusline +=%#Title#
set statusline +=%=
set statusline +=%#Identifier#
set statusline +=\ %v
set statusline +=%#Title#
set statusline +=\ %Y
set statusline +=%#Statement#
set statusline +=\ %{StatusDiagnostic()}
set statusline +=%#Conditional#
set statusline +=\ %{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
