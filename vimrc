call plug#begin('~/.vim/plugged') 

Plug 'tpope/vim-sensible'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'davidhalter/jedi-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
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

:let g:acp_behaviorKeywordLength=1 
:let g:airline_theme='nord'
:let g:airline_powerline_fonts=1
:let g:airline_extensions = ['tabline', 'branch'] 
:let g:NERDTreeMapOpenInTab='<C-n>'
:let g:indentLine_char='┊'
:let g:indentLine_color_term=239
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
":let g:indentLine_setColors = 0

:map <C-\> :NERDTreeToggle<CR>
:syntax on
:colorscheme nord
:filetype plugin on

:nnoremap <S-h> gT
:nnoremap <S-l> gt
:nnoremap <Down> <C-W>j
:nnoremap <Up> <C-W>k
:nnoremap <Right> <C-W>l
:nnoremap <Left> <C-W>h

:nnoremap <Tab> :tabnew<CR>

:autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
:autocmd BufWritePre *.* :%s/\s\+$//e
:autocmd FileType python set sw=4
:autocmd FileType python set ts=4
:autocmd FileType python set sts=4
:autocmd FileType python setlocal completeopt-=preview

":inoremap        (  ()<Left>
":inoremap        "  ""<Left>
":inoremap        `  ``<Left>
":inoremap        '  ''<Left>
":inoremap        [  []<Left>
":inoremap      {  {}<Left>
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
