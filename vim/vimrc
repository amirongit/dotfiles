xnoremap K          :move '<-2<CR>gv-gv
xnoremap J          :move '>+1<CR>gv-gv
nnoremap <Down>   :resize +2<CR>
nnoremap <Up>     :resize -2<CR>
nnoremap <Left>   :vertical resize +2<CR>
nnoremap <Right>  :vertical resize -2<CR>
nnoremap Q          <NOP>
nnoremap J          <NOP>
nnoremap K          <NOP>
nnoremap H          gT
nnoremap L          gt
nnoremap <leader>hls  :set hlsearch!<CR>
set number relativenumber
set scrolloff=3
set nocp
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set ignorecase
set incsearch
set encoding=utf-8
set laststatus=2
set signcolumn=yes
syntax on
highlight clear SignColumn
highlight clear LineNr
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
set statusline +=\[%{mode()}]
set statusline +=\[%F]
set statusline +=\%r
set statusline +=\%m
set statusline +=%=
set statusline +=\[%v]
set statusline +=\[%Y]
