call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim'
Plug 'chriskempson/base16-vim'
Plug 'mhinz/vim-startify'
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

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:coc_status_error_sign = '»'
let g:coc_status_warning_sign = '›'
let g:ascii = [
    \'     .-._               ,-.-. .=-.-.',
    \'    /==/ \  .-._ ,--.-./=/ ,//==/_ /',
    \'    |==|, \/ /, /==/, ||=| -|==|, | ',
    \'    |==|-  \|  |\==\,  \ / ,|==|  | ',
    \'    |==| ,  | -| \==\ -   - /==|- | ',
    \'    |==| -   _ |  \==\ ,   ||==| ,| ',
    \'    |==|  /\ , |  |==| -  ,/|==|- | ',
    \'    /==/, | |- |  \==\  _ / /==/. / ',
    \'    `--`./  `--`   `--`--   `--`-`  ',
        \]
let g:startify_custom_header = g:ascii
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['    Most Recent Files']            },
        \ { 'type': function('s:gitModified'),  'header': ['    Modified Files In Git Repo']},
        \ { 'type': function('s:gitUntracked'), 'header': ['    Untracked Files In Git Repo']},
        \ ]
let g:startify_files_number=20
let g:netrw_banner = 0
let gruvbox_contrast_dark = 'hard'
let g:onedark_termcolors=16
let g:onedark_hide_endofbuffer=1

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
augroup mygroup
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
autocmd CursorHold * silent call CocActionAsync('highlight')

xmap <silent><silent>K    :move '<-2<CR>gv-gv
xmap <silent><silent>J    :move '>+1<CR>gv-gv
xmap <silent><leader>act  <Plug>(coc-codeaction-selected)
xmap <silent><leader>for  <Plug>(coc-format-selected)

imap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
nmap <silent><leader>def          <Plug>(coc-definition)
nmap <silent><leader>tef          <Plug>(coc-type-definition)
nmap <silent><leader>imp          <Plug>(coc-implementation)
nmap <silent><leader>ref          <Plug>(coc-refrences)
nmap <silent><leader>doc          :call <SID>show_documentation()<CR>
nmap <silent><leader>dia          :<C-u>CocList diagnostics<cr>
nmap <silent><leader>com          <Plug>(coc-git-commit)
nmap <silent><leader>act          <Plug>(coc-codeaction-selected)
nmap <silent><leader>ren          <Plug>(coc-rename)
nmap <silent><leader>for          <Plug>(coc-format-selected)
nmap <silent><leader>fix          <Plug>(coc-fix-current)
nmap <silent><nowait><expr><C-J>  coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nmap <silent><nowait><expr><C-K>  coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

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
"set nofoldenable
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
colorscheme base16-default-dark
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
"hi clear PmenuThumb
"hi clear PmenuSbar
"hi Pmenu ctermbg=black ctermfg=white guibg=black guifg=white

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
set statusline +=\ %{StatusDiagnostic()}
set statusline +=\ %{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
