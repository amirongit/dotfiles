require('pckr').add(
    {
        'tpope/vim-dadbod',
        'tpope/vim-fugitive',
        'jiangmiao/auto-pairs',
        'jaredgorski/SpaceCamp',
        'tomasiser/vim-code-dark',
        'nanotech/jellybeans.vim',
        { 'goolord/alpha-nvim',           requires = { 'nvim-tree/nvim-web-devicons' } },
        {
            'nvim-treesitter/nvim-treesitter-context',
            requires = { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        },
        { 'junegunn/fzf.vim',             requires = { 'junegunn/fzf', run = ':call fzf#install()' } },
        { 'neoclide/coc.nvim',            branch = 'release' },
        { 'rcarriga/nvim-dap-ui',         requires = { 'mfussenegger/nvim-dap' } },
        { 'mfussenegger/nvim-dap-python', requires = { 'mfussenegger/nvim-dap' } }
    }
)