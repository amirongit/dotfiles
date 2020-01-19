call plug#begin('~/.vim/plugged') 

Plug 'nanotech/jellybeans.vim'
Plug 'Badacadabra/vim-archery'
Plug 'tpope/vim-sensible'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'davidhalter/jedi-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'dracula/vim'
Plug 'tpope/vim-fugitive'

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
:set omnifunc=syntaxcomplete
:set encoding=utf-8
:set background=dark
:set t_Co=256
:set termguicolors
:set hlsearch!

:let g:acp_behaviorKeywordLength=1 
:let g:airline_theme='jellybeans'
:let g:airline_powerline_fonts=1
:let g:airline_extensions = ['tabline', 'branch'] 
:let g:indentLine_char='┊'
":let g:indentLine_color_term=239
":let g:indentLine_setColors = 0
:let g:jedi#show_call_signatures="2"
:let g:dracula_colorterm=0
:let g:gruvbox_italic=1
:let g:gruvbox_contrast_dark="hard"
:let g:gruvbox_italicize_strings=1
:let g:onedark_termcolors=16
:let g:airline_left_sep = ''
:let g:airline_left_sep = ''
:let g:airline_right_sep = ''
:let g:airline_right_sep = ''
:let g:jellybeans_overrides = { 'background': { 'ctermbg': 'none', '256ctermbg': 'none' },}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

:syntax on
:colorscheme jellybeans
:filetype plugin on

:map <C-f> :set hlsearch!<CR>

:nnoremap <S-h> gT
:nnoremap <S-l> gt
:nnoremap <Down> <C-W>j
:nnoremap <Up> <C-W>k
:nnoremap <Right> <C-W>l
:nnoremap <Left> <C-W>h
:inoremap        (  ()<Left>
:inoremap        "  ""<Left>
:inoremap        `  ``<Left>
:inoremap        '  ''<Left>
:inoremap        [  []<Left>
:inoremap      {  {}<Left>
:inoremap      <  <><Left>
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

:autocmd BufWritePre *.* :%s/\s\+$//e
:autocmd FileType python set sw=4
:autocmd FileType python set ts=4
:autocmd FileType python set sts=4
:autocmd FileType python setlocal completeopt-=preview

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
