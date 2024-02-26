local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not vim.loop.fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            "--filter=blob:none",
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add(
    {
        'tpope/vim-dadbod',
        'tpope/vim-fugitive',
        'lukas-reineke/indent-blankline.nvim',
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

require("cfgpkg")
