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
        'jaredgorski/SpaceCamp',
        'tomasiser/vim-code-dark',
        'nanotech/jellybeans.vim',

        'lukas-reineke/indent-blankline.nvim',

        'tpope/vim-dadbod',
        'tpope/vim-fugitive',
        'goolord/alpha-nvim',

        { 'junegunn/fzf.vim', requires = { 'junegunn/fzf', run = ':call fzf#install()' } },
        'ojroques/nvim-lspfuzzy',

        { 'mfussenegger/nvim-dap', requires = 'nvim-neotest/nvim-nio' },
        'mfussenegger/nvim-dap-python',
        'rcarriga/nvim-dap-ui',

        {
            'williamboman/mason.nvim',
            requires = { 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig' }
        },
        'Decodetalkers/csharpls-extended-lsp.nvim',

        {
            'hrsh7th/cmp-nvim-lsp',
            requires = {
                'hrsh7th/nvim-cmp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
            }
        },

        {
            'nvim-treesitter/nvim-treesitter-context',
            requires = { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        }
    }
)

require("cfgpkg")
