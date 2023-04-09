xmap <silent><silent>K    :move '<-2<CR>gv-gv
xmap <silent><silent>J    :move '>+1<CR>gv-gv
nmap <silent><Down>               :resize +2<CR>
nmap <silent><Up>                 :resize -2<CR>
nmap <silent><Left>               :vertical resize +2<CR>
nmap <silent><Right>              :vertical resize -2<CR>
nmap q                            <NOP>
nmap Q                            <NOP>
nmap H                            gT
nmap L                            gt
nmap <silent><leader>hls          :set hlsearch!<CR>

set splitbelow
set smartcase
set incsearch
set noshowcmd
set clipboard=unnamed,unnamedplus
set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:block
