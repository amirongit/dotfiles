call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
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

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

let g:dracula_italic = 0
let g:coc_status_error_sign = 'e'
let g:coc_status_warning_sign = 'w'
let g:startify_custom_header = startify#pad(startify#fortune#quote())
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['    Recent']},
        \ { 'type': function('s:gitModified'),  'header': ['    Modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['    Untracked']},
        \ ]
let g:startify_files_number=11
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let gruvbox_contrast_dark = 'hard'
let g:onedark_termcolors=16
let g:onedark_hide_endofbuffer=1
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'down':  '30%'}

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
nmap <silent><leader>sym          :<C-u>CocList symbols<cr>
nmap <silent><leader>com          <Plug>(coc-git-commit)
nmap <silent><leader>act          <Plug>(coc-codeaction-selected)
nmap <silent><leader>ren          <Plug>(coc-rename)
nmap <silent><leader>for          <Plug>(coc-format-selected)
nmap <silent><leader>fix          <Plug>(coc-fix-current)
nmap <silent><leader>fzt          :Tags<CR>
nmap <silent><leader>fzh          :History<CR>
nmap <silent><leader>fzc          :Commits<CR>
nmap <silent><leader>fzf          :Files<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <TAB> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() :
        \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

set nobackup
set nohidden
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

set listchars=trail:⋅,space:⋅,eol:¬,tab:→\ ,extends:❯,precedes:❮
" set listchars=trail:.,space:.,eol:$
" set listchars=
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
set foldlevelstart=1
set foldnestmax=5
" set foldlevel=1
set nofoldenable
set pastetoggle=<leader>p
set backspace=indent,eol,start
set shortmess=
set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:block
set updatetime=300
set signcolumn=yes
set laststatus=2
" set colorcolumn=120
" set termguicolors

" appearance
syntax on
colorscheme gruvbox
hi clear SignColumn
hi clear LineNr
hi EndOfBuffer ctermfg=bg ctermbg=bg guifg=bg guibg=bg
hi DiffAdd ctermbg=None ctermfg=white cterm=bold guibg=None guifg=white gui=bold
hi DiffChange ctermbg=None ctermfg=white cterm=bold guibg=None guifg=white gui=bold
hi DiffDelete ctermbg=None ctermfg=white cterm=bold guibg=None guifg=white gui=bold
hi CocWarningSign ctermfg=white cterm=bold guifg=white gui=bold
hi CocErrorSign ctermfg=white cterm=bold guifg=white gui=bold
hi CocHintSign ctermfg=white cterm=bold guifg=white gui=bold
hi clear PmenuThumb
hi clear PmenuSbar
hi clear PmenuSel
hi Pmenu ctermbg=black ctermfg=white guibg=black guifg=white

" statusline
" so $VIMRUNTIME/syntax/hitest.vim
set statusline +=%#StatusLine#
set statusline +=\ %{mode()}
set statusline +=\ %B 
set statusline +=\ %F 
set statusline +=\ %M
set statusline +=\ %R
set statusline +=%=
set statusline +=%#TermCursor#
set statusline +=\ %v
set statusline +=\ %Y
set statusline +=\ %{StatusDiagnostic()}
set statusline +=\ %{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
